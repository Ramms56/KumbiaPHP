<?php

/**
 * Carga del modelo Menus...
 */
Load::models('participante');

class LoginController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index() {
    
    }

   /**
     * Crea un Registro
     */
    public function login(){
        if (Input::hasPost("cuenta","password")){
            $pwd = Input::Post("password");
            $usuario =Input::Post("cuenta");

            $auth = new Auth("model", "class: participante", "cuenta: $usuario", "password: $pwd");
            if ($auth->authenticate()){
                Router::redirect("alumno/inicio");
            }else{
                Flass::error("fallo");
            }
    }
    
    }
    public function create() {
       // print_r($_POST);exit();
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas 
         * dentro del array POST existe uno llamado "menus"
         * el cual aplica la autocarga de objeto para guardar los 
         * datos enviado por POST utilizando autocarga de objeto
         */
        if (Input::hasPost('participante')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $participante = new Participante(Input::post('participante'));
            //En caso que falle la operación de guardar
            if ($participante->create()) {
                Flash::valid('Operación exitosa');
                //Eliminamos el POST, si no queremos que se vean en el form
                Input::delete();
                return;
            } else {
                Flash::error('Falló Operación');
            }
        }
    }
     public function inicio() 
    {
    ///Router::redirect("login/inicio");
    }
}

?>