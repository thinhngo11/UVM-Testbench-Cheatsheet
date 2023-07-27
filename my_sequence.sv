class my_sequence extends uvm_sequence #(my_item);
  `uvm_object_utils(my_sequence)
  
  function new(string name="");
    super.new(name);
  endfunction
  
  virtual task body();
    req = my_item::type_id::create("m_item");
    repeat (50) begin
      if (!req.randomize()) `uvm_error("MYERR", "Can't randomize req");
      start_item(req);
      finish_item(req);
    end
  endtask
endclass
