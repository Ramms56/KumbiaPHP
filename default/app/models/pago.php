<?php

class Pago extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getPago($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}