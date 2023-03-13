
module {
    
    public type CardCollection = {
        name : Text;
        description : Text;
        kind : Text;
        loreContext: Text;
        collectionId : Text;
        standard : Text;
        haveMultipleAC : Bool;
    };

    public type Card = {
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