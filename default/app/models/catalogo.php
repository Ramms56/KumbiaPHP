<?php

class Catalogo extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getCatalogo($page, $ppage = 5) {
        $cols = "id,titulo,descripcion,evento_id,costo,totalhoras,cupolimite";
     	$join ="INNER JOIN actividad ON actividad_id = id_actividad";
     
        return $this->paginate("columns: $cols","join: $join", "page: $page", "per_page: $ppage");
    }

     public function getCatalogos($page, $ppage = 5) {
        $cols = "id,titulo,descripcion,evento_id,costo,totalhoras,cupolimite";
     	$join ="INNER JOIN evento ON evento_id = ideve";
     
        return $this->paginate("columns: $cols","join: $join", "page: $page", "per_page: $ppage");
    }

}	