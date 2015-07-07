<?php

class NockupShop  extends CI_Controller{
    
    
    protected $key  = "LieisoftApi";


    public function __construct() {
        parent::__construct();
        $this->load->model("tshop/tshop_model");
    }
    
    public function index(){
        echo "Nothing do here ....";
        return null;
    }
    
    public function NonArticulos($private_key){
         if(!$this->get_key($private_key)) return NULL;
         
          $r =  $this->tshop_model
             ->get_non_articulos();
        
          print json_encode($r);
    }
    

    public function Articulos($private_key , $id_articulo ){
        
        if(!$this->get_key($private_key)) return NULL;
        
        $r =  $this->tshop_model
             ->get_articulos($id_articulo);
        
       print json_encode($r);
        
    }
    
    
    private function  get_key($private_key){
         if ($this->key != $private_key) {
            return false;
        }else{
            return true;
        }
    }
    
    
    
    
    
}
