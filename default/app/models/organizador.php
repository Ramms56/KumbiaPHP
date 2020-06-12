<?php

class Organizador extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getOrganizador($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}