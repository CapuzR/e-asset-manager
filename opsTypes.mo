
module {

    public type CardCollectionArgs = {
        collectionId : Text;
        name : Text;
        description : Text;
        kind : Text;
        loreContext: Text;
        standard : Text;
        haveMultipleAC : Bool;
        batchUpdate : Bool;
    };

    public type CardArgs = {
        id : Text;
        index : Nat;
        luck : ?Nat;
        url : Text;
        thumbnail : Text;
        collectionName : Text;
        collectionId : Text;
        mimeType : Text;
        action : ?Text;
        target : ?Text;
        amount : ?Nat;
    };
    
    public type CardCollectionSuccess = {
        collectionId : Text;
        name : Text;
        description : Text;
        kind : Text;
        loreContext: Text;
        standard : Text;
        haveMultipleAC : Bool;
        cards : [CardSuccess];
    };

    public type CardCollectionError = {
        #NonExistentCardCollection;
        #CardCollectionAlreadyExists;
        #Unknown : Text;
        #NotAuthorized;
    };

    public type CardSuccess = {
        id : Text;
        index : Nat;
        luck : ?Nat;
        url : Text;
        thumbnail : Text;
        collectionName : Text;
        mimeType : Text;
        action : ?Text;
        target : ?Text;
        amount : ?Nat;
    };
    
    public type CardError = {
        #CardAlreadyExists;
        #NonExistentCard;
        #Unknown : Text;
        #NotAuthorized;
    };

    public type GetCardError = {
        #NonExistentCard;
    };

    public type GetCardCollectionError = {
        #NonExistentCardCollection;
    };

    public type UpdateCardCollectionError = {
        #CardCollectionAlreadyExists;
        #NotAuthorized;
    };

    public type UpdateCardError = {
        #NonExistentCard;
        #Unknown : Text;
        #NotAuthorized;
    };

    public type Error = {
        #NotAuthorized;
    };
}