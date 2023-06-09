import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Trie "mo:base/Trie";

import IT "./initTypes";
import OT "./opsTypes";
import Rels "./modules/Rels";
import ST "./stableTypes";
import U "./utils";
import Auth "./modules/Auth";

shared ({ caller = owner }) actor class (
  initArgs : IT.InitArgs,
) = BRAssetManagement {

  stable var authState = Auth.init(initArgs);
  // stable var admins : [Principal] = initOptions.admins;

  stable var cardCollections : Trie.Trie<Text, ST.CardCollection> = Trie.empty();
  stable var cards : Trie.Trie<Text, ST.Card> = Trie.empty();

  stable var collectionCardRelEntries : [(Text, Text)] = []; //CardCollection collectionId, cardId
  let collectionCardRel = Rels.Rels<Text, Text>((Text.hash, Text.hash), (Text.equal, Text.equal), collectionCardRelEntries);

  public query ({ caller }) func getAllCollections() : async Result.Result<[OT.CardCollectionSuccess], OT.CardCollectionError> {

    let cardCollBuff : Buffer.Buffer<OT.CardCollectionSuccess> = Buffer.Buffer(0);

    label ccf for ((id, cardColl) in Trie.iter(cardCollections)) {
      switch (_getCardCollection(id)) {
        case (#err(e)) {
          continue ccf;
        };
        case (#ok(cardCollection)) {
          cardCollBuff.add(cardCollection);
        };
      };
    };

    #ok(Buffer.toArray(cardCollBuff));
  };

  public query ({ caller }) func getCollectionsByQuery(text : Text) : async Result.Result<[OT.CardCollectionSuccess], OT.CardCollectionError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    let cardCollBuff : Buffer.Buffer<OT.CardCollectionSuccess> = Buffer.Buffer(0);

    label ccf for ((id, cardColl) in Trie.iter(cardCollections)) {
      if (cardColl.name == text or id == text) {
        switch (_getCardCollection(id)) {
          case (#err(e)) {
            continue ccf;
          };
          case (#ok(cardCollection)) {
            cardCollBuff.add(cardCollection);
          };
        };
      } else {
        continue ccf;
      };
    };

    #ok(Buffer.toArray(cardCollBuff));
  };

  public query ({ caller }) func getCard(cardArgs : OT.CardArgs) : async Result.Result<ST.Card, OT.CardError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    _getCard(cardArgs.id);
  };

  public query ({ caller }) func getCardCollection(cardCollectionId : Text) : async Result.Result<OT.CardCollectionSuccess, OT.CardCollectionError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    _getCardCollection(cardCollectionId);
  };

  public shared ({ caller }) func updateCard(cardArgs : OT.CardArgs) : async Result.Result<(), OT.UpdateCardError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    _updateCard(cardArgs, cardArgs.collectionId);
  };

  public shared ({ caller }) func updateCardCollection(cardCollectionArgs : OT.CardCollectionArgs, cardsArgsArr : [OT.CardArgs]) : async Result.Result<(), OT.CardCollectionError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    let cardCollectionId : Text = cardCollectionArgs.collectionId;
    let cardCollectionRes = _getCardCollection(cardCollectionId);
    let batchUpdate : Bool = cardCollectionArgs.batchUpdate;

    switch (cardCollectionRes) {
      case (#err(e)) {
        switch (e) {
          case (#NonExistentCardCollection) {
            #err(#NonExistentCardCollection);
          };
        };
      };
      case (#ok(cardCollection)) {
        let updatedCardCollection : ST.CardCollection = {
          cardCollectionArgs with collectionId = cardCollectionId;
        };

        cardCollections := Trie.replace(
          cardCollections,
          U.keyText(cardCollectionId),
          Text.equal,
          ?updatedCardCollection,
        ).0;

        if (batchUpdate) {
          label fc for (card in cardsArgsArr.vals()) {
            ignore _updateCard(card, cardCollectionArgs.collectionId);
            continue fc;
          };
        };
        #ok(());
      };
    };
  };

  public shared ({caller}) func testQueryA (cardCollectionArgs : OT.CardCollectionArgs) : async () {
    ();
  };
  
  public shared ({caller}) func testQueryB (cardsArgsArr : [OT.CardArgs]) : async () {
    ();
  };

  public shared ({ caller }) func addCardCollection(cardCollectionArgs : OT.CardCollectionArgs, cardsArgsArr : [OT.CardArgs]) : async Result.Result<(), OT.CardCollectionError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    _addCardCollection(cardCollectionArgs, cardsArgsArr);

  };

  public shared ({ caller }) func deleteCard(cardId : Text) : async Result.Result<(), OT.CardError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    _deleteCard(cardId);
  };

  public shared ({ caller }) func deleteCardCollection(cardCollectionId : Text) : async Result.Result<(), OT.CardCollectionError> {

    if (not U.isAdmin(caller, authState.admins)) {
      return #err(#NotAuthorized);
    };

    _deleteCardCollection(cardCollectionId);
  };

  private func _deleteCardCollection(cardCollectionId : Text) : Result.Result<(), OT.CardCollectionError> {

    let cardCollectionRes = _getCardCollection(cardCollectionId);
    switch (cardCollectionRes) {
      case (#err(e)) {
        switch (e) {
          case (#NonExistentCardCollection) {
            #err(#NonExistentCardCollection);
          };
        };
      };
      case (#ok(cardCollection)) {
        cardCollections := Trie.replace(
          cardCollections,
          U.keyText(cardCollectionId),
          Text.equal,
          null,
        ).0;

        label cf for (card in cardCollection.cards.vals()) {
          switch (_deleteCard(card.id)) {
            case (#err(e)) {
              continue cf;
            };
            case (#ok) {
              continue cf;
            };
          };
        };

        #ok(());
      };
    };
  };

  private func _deleteCard(cardId : Text) : Result.Result<(), OT.CardError> {

    let cardRes = _getCard(cardId);
    switch (cardRes) {
      case (#err(e)) {
        switch (e) {
          case (#NonExistentCard) {
            #err(#NonExistentCard);
          };
        };
      };
      case (#ok(oldCard)) {
        cards := Trie.replace(
          cards,
          U.keyText(cardId),
          Text.equal,
          null,
        ).0;
        collectionCardRel.delete(oldCard.collectionId, cardId);

        #ok(());
      };
    };
  };

  private func _addCardCollection(cardCollectionArgs : OT.CardCollectionArgs, cardsArgsArr : [OT.CardArgs]) : Result.Result<(), OT.CardCollectionError> {

    let collectionId = cardCollectionArgs.collectionId;
    let cardCollection : ST.CardCollection = cardCollectionArgs;

    let (newCardCollection, exists) = Trie.put(
      cardCollections,
      U.keyText(collectionId),
      Text.equal,
      cardCollectionArgs,
    );

    switch (exists) {
      case null {
        cardCollections := newCardCollection;

        label fc for (card in cardsArgsArr.vals()) {
          switch (_addCard(card, collectionId)) {
            case (#err(e)) {
              continue fc;
            };
            case (#ok) {
              continue fc;
            };
          };
        };

        #ok(());
      };
      case (?cc) {
        #err(#CardCollectionAlreadyExists);
      };
    };
  };

  private func _addCard(cardArgs : OT.CardArgs, collectionId : Text) : Result.Result<(), OT.CardError> {

    let id = cardArgs.id;
    let card : ST.Card = cardArgs;

    let (newCards, exists) = Trie.put(
      cards,
      U.keyText(id),
      Text.equal,
      card,
    );

    switch (exists) {
      case null {
        cards := newCards;
        collectionCardRel.put(collectionId, id);
        #ok(());
      };
      case (?v) {
        #err(#CardAlreadyExists);
      };
    };
  };

  private func _updateCard(cardArgs : OT.CardArgs, cardCollectionId : Text) : Result.Result<(), OT.UpdateCardError> {

    let cardId : Text = cardArgs.id;
    let cardRes = _getCard(cardId);
    switch (cardRes) {
      case (#err(e)) {
        switch (e) {
          case (#NonExistentCard) {
            ignore _addCard(cardArgs, cardCollectionId);
            #ok(());
          };
        };
      };
      case (#ok(oldCard)) {

        let updatedCard : ST.Card = {
          cardArgs with collectionId = cardCollectionId;
        };

        cards := Trie.replace(
          cards,
          U.keyText(cardId),
          Text.equal,
          ?updatedCard,
        ).0;
        collectionCardRel.put(cardCollectionId, cardId);

        #ok(());
      };
    };
  };

  private func _getCardCollection(cardCollectionId : Text) : Result.Result<OT.CardCollectionSuccess, OT.GetCardCollectionError> {

    let cardCollectionRes = Trie.find(
      cardCollections,
      U.keyText(cardCollectionId),
      Text.equal,
    );

    switch (cardCollectionRes) {
      case null {
        #err(#NonExistentCardCollection);
      };
      case (?cardCollection) {
        let cardBuff : Buffer.Buffer<OT.CardSuccess> = Buffer.Buffer(0);
        let cardsIdsArray : [Text] = collectionCardRel.get0(cardCollectionId);

        label cf for (cardId in cardsIdsArray.vals()) {

          switch (_getCard(cardId)) {
            case (#err(e)) {
              continue cf;
            };
            case (#ok(card)) {

              let cardSuccess : OT.CardSuccess = {
                card with id = cardId;
              };

              cardBuff.add(cardSuccess);
            };
          };
        };

        #ok({
          cardCollection with cards = Buffer.toArray(cardBuff);
        });
      };
    };
  };

  private func _getCard(cardId : Text) : Result.Result<ST.Card, OT.GetCardError> {

    let cardRes = Trie.find(
      cards,
      U.keyText(cardId),
      Text.equal,
    );

    switch (cardRes) {
      case null {
        #err(#NonExistentCard);
      };
      case (?card) {
        #ok(card);
      };
    };

  };

  private func getAllCollectionCardRels() : [(Text, Text)] {
    collectionCardRel.getAll();
  };

//-------------------Authentication

    public shared({caller}) func manageAuth (authArgs : Auth.AuthArgs) : async Result.Result<?[Principal], Auth.Error> {
        
        if(not Auth.isAuthorized(caller, authState.admins)) {
            return #err(#NotAuthorized);
        };

        #ok(Auth.manageAuth(authArgs, caller, authState));
    };

  system func preupgrade() {
    collectionCardRelEntries := getAllCollectionCardRels();
  };

  system func postupgrade() {
    collectionCardRelEntries := [];
  };

};