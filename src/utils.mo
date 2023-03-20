import Principal "mo:base/Principal";
import Trie "mo:base/Trie";
import Text "mo:base/Text";

module {
    
    public func isAdmin(p : Principal, admins : [Principal]) : Bool {

        if(Principal.isAnonymous(p)) {
            return false;
        };

        for (admin in admins.vals()) {
            if (Principal.equal(admin, p)) return true;
        };
        false;
    };
  
    public func key(x : Principal) : Trie.Key<Principal> {
        return { key = x; hash = Principal.hash(x) }
    };

    public func keyText(x : Text) : Trie.Key<Text> {
        return { key = x; hash = Text.hash(x) }
    };

}