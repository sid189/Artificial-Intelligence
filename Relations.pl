/*Defining the edges */
edge(humans, ako, creature).
edge(birds, ako, creature).
edge(man, ako, humans).
edge(turkey, ako, birds).
edge(louis, isa, man).
edge(albert, isa, man).
edge(frank, isa, turkey).

/*Defining the properties */

property(humans,legs,2).

property(louis,legs,1). 
property(birds,fly,yes).
property(turkey,fly,no).

/*Defining the relations between nodes */

rel(SN1,RT1,DN1) :- edge(SN1,RT1,DN1). 

/*Cut, if the property is fulfilled*/

rel(SN1,fly,DN1) :- property(SN1,fly,DN1), !.
					 

rel(SN1,legs,DN1) :- property(SN1,legs,DN1), !.

/*Basic relation between two nodes */

rel(SN1,isa,DN1) :- edge(SN1,isa,Node), rel(Node,ako,DN1).
rel(SN1,ako,DN1) :- edge(SN1,ako,Node), rel(Node,ako,DN1).

/*Number of legs? */

rel(SN1,legs,DN1) :- edge(SN1,isa,Node), rel(Node,legs,DN1).
rel(SN1,legs,DN1) :- edge(SN1,ako,Node), rel(Node,legs,DN1).

/*Can the creature fly? */

rel(SN1,fly,DN1) :- edge(SN1,isa,Node), rel(Node,fly,DN1).
rel(SN1,fly,DN1) :- edge(SN1,ako,Node), rel(Node,fly,DN1).
