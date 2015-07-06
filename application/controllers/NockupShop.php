<?php

class NockupShop  extends CI_Controller{
    
    
    protected $key  = "LieisoftApi";


    public function __construct() {
        parent::__construct();
        
        /**Cargamos las librerias necesarias para tshop*/
        
        $this->load->model("tshop/tshop_model");
    }
    
    public function index(){
        echo "Nothing do here ....";
        return null;
    }
    
    public function Articulos($private_key){
       
        if ($this->key != $private_key) {
            return null;
        }
        
        $this->tshop_model->get_articulos();
        
    }
    
    
    
    
    
}
