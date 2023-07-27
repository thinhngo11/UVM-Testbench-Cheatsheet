interface my_if;
  bit reset, clk, d, enable, q;
  m_reset: assert property (@(posedge clk) reset |=> !q);// $display("m_reset asserted"); else $display("m_reset failed");
  property p_enable;
    bit d_prev, q_prev, enable_prev;
    @(posedge clk) (enable & !reset, d_prev = d) |=> (q == d_prev);
  endproperty
    m_enable: assert property (p_enable);// $display("m_enable asserted"); else $display("m_enable failed");
      c_enable: cover property (p_enable);// $display("m_enable covered");
endinterface
