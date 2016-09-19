`include "hw1.v"

module demorgan_test ();


    reg A, B;                      
    wire nA, nB, AandB, AorB;    
    wire nAandnB, nAandB, nAorB, nAornB;

    demorgan dut(A, B, nA, nB, AandB, AorB, nAandnB, nAandB, nAorB, nAornB);  


initial begin

    $display("A B | ~A ~B | ~A~B ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    A=0;B=1; #1                                
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAandnB);

    $display("A B | A+B | ~(A+B) ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    A=0;B=1; #1                            
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    A=1;B=0; #1
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    A=1;B=1; #1
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    $display();

    $display("A B | A*B | ~(AB) ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=0;B=1; #1                            
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=1;B=0; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=1;B=1; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    $display();

    $display("A B | ~A ~B | (~A)+(~B) ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    A=0;B=1; #1                            
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |   %b  ", A,B, nA, nB, nAornB);
    $display();

  end
endmodule 