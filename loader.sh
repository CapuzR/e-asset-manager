# Add Meninas Collection with 3 Cards.
dfx canister call --network local e_asset_manager addCardCollection '(
   record {
      collectionId = "k4qsa-4aaaa-aaaah-qbvnq-cai";
      name = "Meninas";
      description = "Faceted Meninas are the most powerful creature species in the Elementum Universo, their magic powers bring strength to allies and help maximize their inner power!";
      kind = "Internal";
      loreContext = "This unique and limited-edition 3D-video collection is inspired by the works of famous artist Diego Velasquez, the leading artist of the Spanish Golden Age. A collection of only 102 NFTs, the Faceted Meninas is the 1st in a series of Elementum NFT releases which can be used to increase your odds of winning ICP in our upcoming game Bounty Rush!";
      standard = "EXT";
      haveMultipleAC = false;
      batchUpdate = true;
      filters = vec {
         variant {
            Traits = vec {
               record {
                  name = "State";
                  kind = variant {
                     Checkbox = record {
                        options = vec {
                           "Floating";
                           "Spinning";
                           "Static"
                        }
                     }
                  }
               };
               record {
                  name = "Condition";
                  kind = variant {
                     Checkbox = record {
                        options = vec {
                           "Bounded";
                           "Space";
                           "Isolated"
                        }
                     }
                  }
               };
               record {
                  name = "Color";
                  kind = variant {
                     Checkbox = record {
                        options = vec {
                           "Nuanced";
                           "Unicolor"
                        }
                     }
                  }
               }
            }
         };
         variant {
            ElementumGeneral = vec {
               record {
                  name = "Elementum";
                  kind = variant {
                     Checkbox = record {
                        options = vec {
                           "Fire";
                           "Water";
                           "Air";
                           "Earth";
                           "Psique";
                           "Vibrum"
                        }
                     }
                  }
               }
            }
         };
         variant {
            BountyRush = vec {
               record {
                  name = "Luck";
                  kind = variant {
                     Range = vec {
                        1;
                        20;
                     }
                  }
               }
            }
         }
      }
   },
   vec {
      record {
         id = "srd5d-nakor-uwiaa-aaaaa-b4anl-maqca-aaaaa-a";
         index = 1;
         url = "https://k4qsa-4aaaa-aaaah-qbvnq-cai.raw.ic0.app/tokenid=srd5d-nakor-uwiaa-aaaaa-b4anl-maqca-aaaaa-a";
         thumbnail = "https://k4qsa-4aaaa-aaaah-qbvnq-cai.raw.ic0.app/tokenid=srd5d-nakor-uwiaa-aaaaa-b4anl-maqca-aaaaa-a";
         collectionName = "Elementum: Faceted Meninas";
         collectionId = "k4qsa-4aaaa-aaaah-qbvnq-cai";
         mimeType = "video/mp4";
         stats = vec {
            variant {
               Traits = vec {
                  record {
                     name = "State";
                     value = variant { Text = "Floating" }
                  };
                  record {
                     name = "Condition";
                     value = variant { Text = "Space" }
                  };
                  record {
                     name = "Color";
                     value = variant { Text = "Nuanced" }
                  }
               }
            };
            variant {
               ElementumGeneral = vec {
                  record {
                     name = "Elementum";
                     value = variant {
                        Array = vec {
                           variant { Text = "Fire" };
                           variant { Text = "Water" };
                           variant { Text = "Air" };
                           variant { Text = "Earth" };
                           variant { Text = "Psique" };
                           variant { Text = "Vibrum" }
                        }
                     }
                  }
               }
            };
            variant {
               BountyRush = vec {
                  record {
                     name = "Luck";
                     value = variant { Nat = 20 }
                  }
               }
            }
         }
      };
      record {
         id = "4naoc-iqkor-uwiaa-aaaaa-b4anl-maqca-aaaaa-q";
         index = 1;
         url = "https://k4qsa-4aaaa-aaaah-qbvnq-cai.raw.ic0.app/tokenid=4naoc-iqkor-uwiaa-aaaaa-b4anl-maqca-aaaaa-q";
         thumbnail = "https://k4qsa-4aaaa-aaaah-qbvnq-cai.raw.ic0.app/tokenid=4naoc-iqkor-uwiaa-aaaaa-b4anl-maqca-aaaaa-q";
         collectionName = "Elementum: Faceted Meninas";
         collectionId = "k4qsa-4aaaa-aaaah-qbvnq-cai";
         mimeType = "video/mp4";
         stats = vec {
            variant {
               Traits = vec {
                  record {
                     name = "State";
                     value = variant { Text = "Floating" }
                  };
                  record {
                     name = "Condition";
                     value = variant { Text = "Space" }
                  };
                  record {
                     name = "Color";
                     value = variant { Text = "Nuanced" }
                  }
               }
            };
            variant {
               ElementumGeneral = vec {
                  record {
                     name = "Elementum";
                     value = variant {
                        Array = vec {
                           variant { Text = "Fire" };
                           variant { Text = "Water" };
                           variant { Text = "Air" };
                           variant { Text = "Earth" };
                           variant { Text = "Psique" };
                           variant { Text = "Vibrum" }
                        }
                     }
                  }
               }
            };
            variant {
               BountyRush = vec {
                  record {
                     name = "Luck";
                     value = variant { Nat = 18 }
                  }
               }
            }
         }
      };
      record {
         id = "pje3b-gakor-uwiaa-aaaaa-b4anl-maqca-aaaab-a";
         index = 1;
         url = "https://k4qsa-4aaaa-aaaah-qbvnq-cai.raw.ic0.app/tokenid=pje3b-gakor-uwiaa-aaaaa-b4anl-maqca-aaaab-a";
         thumbnail = "https://k4qsa-4aaaa-aaaah-qbvnq-cai.raw.ic0.app/tokenid=pje3b-gakor-uwiaa-aaaaa-b4anl-maqca-aaaab-a";
         collectionName = "Elementum: Faceted Meninas";
         collectionId = "k4qsa-4aaaa-aaaah-qbvnq-cai";
         mimeType = "video/mp4";
         stats = vec {
            variant {
               Traits = vec {
                  record {
                     name = "State";
                     value = variant { Text = "Floating" }
                  };
                  record {
                     name = "Condition";
                     value = variant { Text = "Space" }
                  };
                  record {
                     name = "Color";
                     value = variant { Text = "Nuanced" }
                  }
               }
            };
            variant {
               ElementumGeneral = vec {
                  record {
                     name = "Elementum";
                     value = variant {
                        Array = vec {
                           variant { Text = "Fire" };
                           variant { Text = "Water" };
                           variant { Text = "Air" };
                           variant { Text = "Earth" };
                           variant { Text = "Psique" };
                           variant { Text = "Vibrum" }
                        }
                     }
                  }
               }
            };
            variant {
               BountyRush = vec {
                  record {
                     name = "Luck";
                     value = variant { Nat = 18 }
                  }
               }
            }
         }
      }
   }
   )';

# Add Interitus Collection with 3 Cards.
dfx canister call --network local e_asset_manager addCardCollection '(
   record {
      collectionId = "zejmq-rqaaa-aaaah-qcnsq-cai";
      name = "Interitus";
      description = "Interitus are phenomena from all across The Universo with very powerful effects to help their user conquer their opponents or change the flow of the game";
      kind = "Internal";
      loreContext = "This unique 3D-video collection showcases some of the most powerful phenomena in Elementum s Universo A collection of 700, Interitus is the second collection in a series of Elementum NFT releases called Cambrian which can be used to increase your odds of winning ICP in our upcoming game Bounty Rush!";
      standard = "EXT";
      haveMultipleAC = false;
      batchUpdate = true;
      filters = vec {
         variant {
            Traits = vec {
               record {
                  name = "Type";
                  kind = variant {
                     Checkbox = record {
                        options = vec {
                           "Meteor";
                           "Labyrinth";
                           "Anomaly";
                           "Comet";
                           "Wall";
                           "Supernova";
                           "Wall";
                           "Supernova";
                           "Cyclone";
                           "Obsidian Tunnel";
                           "Black Hole";
                           "Solar Flare";
                           "Galaxy Strike";
                           "Glow";
                        }
                     }
                  }
               }
            }
         };
         variant {
            ElementumGeneral = vec {
               record {
                  name = "Elementum";
                  kind = variant {
                     Checkbox = record {
                        options = vec {
                           "Fire";
                           "Water";
                           "Air";
                           "Earth";
                           "Psique";
                           "Vibrum"
                        }
                     }
                  }
               }
            }
         };
         variant {
            BountyRush = vec {
               record {
                  name = "Luck";
                  kind = variant {
                     Range = vec {
                        1;
                        20;
                     }
                  }
               }
            }
         }
      }
   },
   vec {
      record {
         id = "auvcz-iqkor-uwiaa-aaaaa-b4atm-uaqca-aaaaa-a";
         index = 1;
         url = "https://yusot-paaaa-aaaaj-qallq-cai.raw.ic0.app/?index=0";
         thumbnail = "https://yusot-paaaa-aaaaj-qallq-cai.raw.ic0.app/?index=0";
         collectionName = "Interitus";
         collectionId = "zejmq-rqaaa-aaaah-qcnsq-cai";
         mimeType = "video/mp4";
         stats = vec {
            variant {
               Traits = vec {
                  record {
                     name = "Type";
                     value = variant { Text = "Meteor" }
                  }
               }
            };
            variant {
               ElementumGeneral = vec {
                  record {
                     name = "Elementum";
                     value = variant {
                        Array = vec {
                           variant { Text = "Fire" }
                        }
                     }
                  }
               }
            };
            variant {
               BountyRush = vec {
                  record {
                     name = "Luck";
                     value = variant { Nat = 4 }
                  }
               }
            }
         }
      };
      record {
         id = "oiwry-nakor-uwiaa-aaaaa-b4atm-uaqca-aaaaa-q";
         index = 1;
         url = "https://zz4k5-aiaaa-aaaaj-qalma-cai.raw.ic0.app/?index=0";
         thumbnail = "https://zz4k5-aiaaa-aaaaj-qalma-cai.raw.ic0.app/?index=0";
         collectionName = "Interitus";
         collectionId = "zejmq-rqaaa-aaaah-qcnsq-cai";
         mimeType = "video/mp4";
         stats = vec {
            variant {
               Traits = vec {
                  record {
                     name = "Type";
                     value = variant { Text = "Meteor" }
                  }
               }
            };
            variant {
               ElementumGeneral = vec {
                  record {
                     name = "Elementum";
                     value = variant {
                        Array = vec {
                           variant { Text = "Water" }
                        }
                     }
                  }
               }
            };
            variant {
               BountyRush = vec {
                  record {
                     name = "Luck";
                     value = variant { Nat = 3 }
                  }
               }
            }
         }
      };
      record {
         id = "5mse3-dqkor-uwiaa-aaaaa-b4atm-uaqca-aaaab-a";
         index = 1;
         url = "https://z65mj-nqaaa-aaaaj-qalmq-cai.raw.ic0.app/?index=0";
         thumbnail = "https://z65mj-nqaaa-aaaaj-qalmq-cai.raw.ic0.app/?index=0";
         collectionName = "Interitus";
         collectionId = "zejmq-rqaaa-aaaah-qcnsq-cai";
         mimeType = "video/mp4";
         stats = vec {
            variant {
               Traits = vec {
                  record {
                     name = "Type";
                     value = variant { Text = "Meteor" }
                  }
               }
            };
            variant {
               ElementumGeneral = vec {
                  record {
                     name = "Elementum";
                     value = variant {
                        Array = vec {
                           variant { Text = "Air" }
                        }
                     }
                  }
               }
            };
            variant {
               BountyRush = vec {
                  record {
                     name = "Luck";
                     value = variant { Nat = 10 }
                  }
               }
            }
         }
      }
   }
)';