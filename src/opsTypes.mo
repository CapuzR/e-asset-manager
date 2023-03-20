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
        filters : [Filter];
    };

    type Filter = {
        #Traits : [FilterDetails];
        #ElementumGeneral : [FilterDetails];
        #BountyRush : [FilterDetails];
    };

    type FilterDetails = {
        name : Text;
        kind : FieldType;
    };

    type FieldType = {
        #Checkbox : Checkbox;
        #Range : [Nat]; //This Range is inclusive in both sides.
        #TextField : Text;
    };

    type Checkbox = {
        options : [Text];
    };

    type Property = { name : Text; value : Value };

    type Value = {
        #Array : [Value];
        #Principal : Principal;
        #Class : [Property];
        #Option : ?Value;
        #Bytes : [Nat8];

        #Nat : Nat;
        #Nat8 : Nat8;
        #Nat16 : Nat16;
        #Nat32 : Nat32;
        #Nat64 : Nat64;
    
        #Int : Int;
        #Int8 : Int8;
        #Int16 : Int16;
        #Int32 : Int32;
        #Int64 : Int64;


        #Blob : Blob;
        #Bool : Bool;
        #Text : Text;
        #Float : Float;
    };

    public type CardArgs = {
        id : Text;
        index : Nat;
        url : Text;
        thumbnail : Text;
        collectionName : Text;
        collectionId : Text;
        mimeType : Text;
        stats : [CardStats]
    };

    type CardStats = {
        #Traits : [Property];
        #ElementumGeneral : [Property];
        #BountyRush : [Property];
    };    
    
    public type CardCollectionSuccess = {
        collectionId : Text;
        name : Text;
        description : Text;
        kind : Text;
        loreContext: Text;
        standard : Text;
        haveMultipleAC : Bool;
        filters : [Filter];
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
        url : Text;
        thumbnail : Text;
        collectionName : Text;
        mimeType : Text;
        stats : [CardStats];
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