<?php

class NockupShop  extends CI_Controller{
    
    
    protected $key  = "LieisoftApi";


    public function __construct() {
        parent::__construct();
        $this->load->model("tshop/tshop_model");
        $this->key = $this->tshop_model->get_privatekey();
    }
    
    public function index(){
        echo "Nothing do here ....";
        return null;
    }
    
    public function NonArticulos($private_key , $c = null){
         $this->output->set_header("Access-Control-Allow-Origin: *");
         
         if(!$this->get_key($private_key)) return NULL;
         
          $r =  $this->tshop_model
             ->get_non_articulos();
        
          print json_encode($r);
    }
    
    public function Articulos($private_key , $id_articulo  , $c = null){
        $this->output->set_header("Access-Control-Allow-Origin: *");
       
        if(!$this->get_key($private_key)) return NULL;
        
        $r =  $this->tshop_model
             ->get_articulos($id_articulo);
        
       // print "<pre>" ;
       // print_r($r);
       // print "</pre>";
       print json_encode($r);
        
    }
    
    public function GetImages($image , $c = NULL){
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->library("base_url");
        print $this->base_url->GetBaseUrl("/images/articulos") . "/" . $image;
    }
    
    public function generate_key($old_key , $c = NULL){
           if(!$this->get_key($old_key)) return;
           print $this->tshop_model->change_private_key();
    }
    
    private function  get_key($private_key){
         if ($this->key != $private_key) {
            return false;
        }else{
            return true;
        }
    }
    
    
    
    
    
}
