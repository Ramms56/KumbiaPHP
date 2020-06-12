<?php

class Ponente extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getPonente($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}



//tabla cargo tiene idcargo
//tabla empleado tiene cargo
