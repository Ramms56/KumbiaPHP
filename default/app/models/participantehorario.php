<?php

class Participantehorario extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getParticipantehorario($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}