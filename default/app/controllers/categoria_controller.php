<?php

/**
 * Carga del modelo Menus...
 */
Load::models('categoria');

class CategoriaController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index($page = 1) {
        $categoria = new Categoria();
        $this->listCategoria = $categoria->getcategoria($page);
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
        if (Input::hasPost('categoria')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $categoria = new Categoria(Input::post('categoria'));
            //En caso que falle la operación de guardar
            if ($categoria->create()) {
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
    public function edit($idc) {
        $categoria= new Categoria();

        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('categoria')) {

            if ($categoria->update(Input::post('categoria'))) {
                Flash::valid('Operación exitosa');
                //enrutando por defecto al index del controller
                return Router::redirect();
            } else {
                Flash::error('Falló Operación');
            }
        } else {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->categoria = $categoria->find_by_idc((int) $idc);
        }
    }

    /**
     * Eliminar un menu
     * 
     * @param int $id (requerido)
     */
    public function del($idc) {
        $categoria = new Categoria();
        if ($categoria->delete((int) $idc)) {
            Flash::valid('Operación exitosa');
        } else {
            Flash::error('Falló Operación');
        }

        //enrutando por defecto al index del controller
        return Router::redirect();
    }

}