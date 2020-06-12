<?php

class Evento extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getEvento($page, $ppage = 5) {
        
     
     $cols = "id,titulo,descripcion,fechainicio,fechafin,observaciones,logotipo,eslogan,lugar,descripcionc,inicioregistro,cierreregistro,organizador_id";
     $join ="INNER JOIN categoria ON categoria_id = idc";
	 return $this->paginate("columns: $cols","join: $join", "page: $page", "per_page: $ppage");

    }

   
    }
    







  