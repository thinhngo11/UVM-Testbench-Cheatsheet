class my_driver extends uvm_driver #(my_item);
  `uvm_component_utils(my_driver)
  
  virtual my_if vif;
  
  function new(string name="my_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
      `uvm_fatal("VIF", "can't get vif")
  endfunction
      
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    forever begin
      @(posedge vif.clk);
      seq_item_port.get_next_item(req);
      repeat (req.delay) @(vif.clk);
      vif.reset = req.reset;
      vif.enable = req.enable;
      vif.d = req.d; 
      seq_item_port.item_done();
    end
  endtask
endclass
