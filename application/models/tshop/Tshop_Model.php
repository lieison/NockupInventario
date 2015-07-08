<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Tshop_Model
 *
 * @author Yo
 */
class Tshop_Model extends CI_Model {
    
    
    var $query  = NULL;
    
    
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    
    public function get_articulos($id){
        
        $this->query = "SELECT 
                        articulos.nombre as 'nombre',
                        articulos.descripcion as 'descripcion',
                        color.nombre as 'color',
                        color.referencia as 'color_ref',
                        art_variaciones.cantidad as 'cantidad',
                        art_variaciones.costo_total as 'costo_total',
                        art_variaciones.recargo as 'recargo' ,
                        art_variaciones.tallas as 'tallas',
                        art_variaciones.fecha as 'fecha' ,
                        art_variaciones.descripcion as 'art_descripcion' ,
                        adjunto.adjunto as 'adjunto_data'
                        FROM articulos 
                        INNER JOIN art_variaciones ON art_variaciones.id_articulo=articulos.id_articulos
                        LEFT JOIN color ON color.id_color=art_variaciones.id_color
                        LEFT JOIN adjunto ON adjunto.id_adjunto=art_variaciones.id_adjunto
                        WHERE articulos.id_articulos like ? ;";
        
        $result = $this->db
                ->query($this->query , $id)
                ->result_object();
        
      
        return $result;
        
    }
    
    
    public function get_non_articulos(){
        $this->query = "SELECT id_articulos as 'id' "
                . ", nombre as 'nombre' "
                . ", descripcion as 'descripcion' "
                . " FROM articulos WHERE status_shop LIKE 1";
         
        $result = $this->db
                ->query($this->query)
                ->result_object();
        
        return $result;
    }
    
  /*  public function get_prod_byart(){
        
        $this->query = "SELECT 
                        articulos.id_articulos as 'art_id',
                        producto.costo_estimado as 'costo_estimado' ,
                        compra_producto.precio as 'precio_producto' ,
                        compra_producto.cantidad as 'prod_cantidad'
                        FROM art_prod 
                        INNER JOIN articulos ON articulos.id_articulos=art_prod.id_articulo
                        INNER JOIN producto ON producto.id_producto=art_prod.id_producto
                        INNER JOIN compra_producto ON compra_producto.id_producto = producto.id_producto
                        WHERE articulos.status_shop LIKE 1;";
       
        return $result = $this->db->query($this->query)->result_object();
       
     
    }*/
    
    
   /* public function get_count_products(){
        
        $data_prod      = $this->get_prod_byart();
        $total          = 0.0;
        $id_art         = NULL;
        $arr_art        = array();
        $i              = 1;
        $j              = 1;
        $c              = sizeof($this->get_prod_byart());
        
        foreach($data_prod as $class){
              $j++;
              
              if($id_art == NULL){
                  $id_art = $class->art_id;
              }
              elseif($id_art != $class->art_id ){
                  $arr_art[$i] = array(
                      "id_art" => $id_art , 
                      "total" => $total
                  );
                  $i++;
                  $total = 0.0;
                  $id_art = $class->art_id;
              }
            
              if(!empty($class->precio_producto) 
                      || $class->precio_producto != 0)
              {
                  $total += (double) $class->precio_producto;
              }else{
                  $total += (double) $class->costo_estimado;
              }
              
              if(($j-1) == $c){
                    $arr_art[$i] = array(
                      "id_art" => $id_art , 
                      "total" => $total
                  );
              }
 
        }
        
        return $arr_art;
        
    }
    
    public function get_articulos(){
        
         $products_     = $this->get_count_products();
         $articles      = array();
         
         foreach ($products_ as $key =>$adicionales){
             
             $this->query = "SELECT sum(adicionales.costo) as 'ad_costos'
                             FROM adicionales 
                             INNER JOIN articulos ON articulos.id_articulos=adicionales.id_articulo
                             WHERE articulos.id_articulos LIKE ? ;";
             
             $result = $this->db
                     ->query($this->query , $adicionales["id_art"])
                     ->result_object();
             
             $products_[$key]['total'] += (double) $result[0]->ad_costos;
         }
         
          echo "<pre>";
          print_r($products_);
          echo "</pre>";
         
        
    }*/
    
    
   
}
