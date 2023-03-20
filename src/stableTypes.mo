
module {
    
    public type CardCollection = {
        name : Text;
        description : Text;
        kind : Text;
        loreContext: Text;
        collectionId : Text;
        standard : Text;
        haveMultipleAC : Bool;
        filters : [Filter];
    };

    type Filter = {
        #Traits : [FilterDetails];
        #ElementumGeneral : [FilterDetails];
        #BountyRush : [FilterDetails];
    };

    type FilterDetails = {
        kind : FieldType;
        name : Text;
    };

    type FieldType = {
        #Checkbox : Checkbox;
        #Range : [Nat];
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

    public type Card = {
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
    
    // public type mainSettings = {

    // };
    
    // public type Standard = {
    //     name : Text;
    //     idl : Text;
    // };
    
    // public type Operator = {
    //     #Add : null;
    //     #Div : null;
    //     #Mul : null;
    //     #Sub : null;
    //     #Mod : null;
    //     #Pow : null;
    // };

    // public type Target = {
    //     #Opponent : null;
    //     #Player : null;
    // };

}