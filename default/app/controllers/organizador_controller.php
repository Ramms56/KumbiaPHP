<?php

/**
 * Carga del modelo Menus...
 */
Load::models('organizador');

class OrganizadorController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index($page = 1) {
        $organizador = new Organizador();
        $this->listOrganizador = $organizador->getorganizador($page);
    }

    /**
     * Crea un Registro
     */
    public function create() {
       // print_r($_POST);exit();
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas 
         * dentro del array POST existe uno llamado "menus"
         * el cual aplica la autocarga de objeto para guardar los 
         * datos enviado por POST utilizando autocarga de objeto
         */
        if (Input::hasPost('organizador')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $organizador = new Organizador(Input::post('organizador'));
            //En caso que falle la operación de guardar
            if ($organizador->create()) {
                Flash::valid('Operación exitosa');
                //Eliminamos el POST, si no queremos que se vean en el form
                Input::delete();
                return;
            } else {
                Flash::error('Falló Operación');
            }
        }
    }

    /**
     * Edita un Registro
     *
     * @param int $id (requerido)
     */
    public function edit($id) {
        $organizador= new Organizador();

        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('organizador')) {

            if ($organizador->update(Input::post('organizador'))) {
                Flash::valid('Operación exitosa');
                //enrutando por defecto al index del controller
                return Router::redirect();
            } else {
                Flash::error('Falló Operación');
            }
        } else {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->organizador = $organizador->find_by_id((int) $id);
        }
    }

    /**
     * Eliminar un menu
     * 
     * @param int $id (requerido)
     */
    public function del($id) {
        $organizador = new Organizador();
        if ($organizador->delete((int) $id)) {
            Flash::valid('Operación exitosa');
        } else {
            Flash::error('Falló Operación');
        }

        //enrutando por defecto al index del controller
        return Router::redirect();
    }

}