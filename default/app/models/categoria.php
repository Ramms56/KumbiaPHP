<?php

class Categoria extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getCategoria($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}