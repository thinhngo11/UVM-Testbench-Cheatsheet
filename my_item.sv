class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand logic reset;
  rand logic enable;
  rand logic d;
  logic q;
  rand int delay;
  
  constraint c_reset {reset dist {1:=1, 0:=5};}  
  constraint c_delay {delay < 3;}
  
  function new(string name="");
    super.new(name);
  endfunction
  
  virtual function void do_copy(uvm_object rhs);
    my_item tx;
    $cast(tx, rhs);
    super.do_copy(rhs);
    reset = tx.reset;
    enable = tx.enable;
    d = tx.d;
    q = tx.q;
    delay = tx.delay;
  endfunction
endclass
