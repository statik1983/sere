private["_separator1","_txt"];
cutText ["HOLD LEFT-CLICK ON TEXT AND DRAG UP AND DOWN, PRESS ESCAPE TO CLEAR OR CONTINUE ON BOTTOM!", "PLAIN DOWN"];
sleep 1;
"Base Building Help" hintC [
															" Base Building requires a flagpole, build one first to design base within "+str(BBFlagRadius)+" meters.",
															" Removing a flagpole requires you to remove all buildings in the build radius.",
															" Base Building ingredients are: Tank Trap Kits, Sandbags, Wire Fencing Kits, Wood, Scrap Metal, Grenades, Scrap Electronics,", 
															"  Wooden Crates, Wooden Pallets, Duct Tape, Camo Nets, Glass, Nails, Jerry Can, Generator, Metal Sheets, Rope, Bricks.",
															" Visit SERE-DAYZ.ENJIN.COM for instructions and pictures on how to use Base Building.",														
															" Certain Base Buildings can be elevated and you will get extended build options.",
															" Some building objects will shift after you select 'Preview', this is how it will look at server restart (reposition to adjust).",
															" Info_stands give access to concrete walls within 15 meters, and all roofs, as well as lighting options around your base.",
															" 'Give access to object' action gives all players tied to your FlagPole access to that object, either to remove/operate.",
															" Booby traps will only be triggered by players that are not added to the object manually or 'Give access action'.",
															" Any unrealistic building designs, e.g (floating objects[not roofs]) will be removed."
															];