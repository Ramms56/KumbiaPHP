<?php

class Pagodetalle extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getPagodetalle($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}