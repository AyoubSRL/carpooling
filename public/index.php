<?php

use Controller\AdminController;
use DI\Container as Container;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Log\LoggerInterface;
use Slim\Factory\AppFactory;

use Controller\ProdottoController;
use Controller\AutistiController;
use Controller\PasseggeriController;
use Controller\VeicoliControlller;
use Controller\ViaggiController;
use Controller\PrenotazioniController;
use Controller\FeedbackControlleraut;
use Controller\FeedbackControllerpas;


require '../vendor/autoload.php';
require_once '../conf/config.php';
use League\Plates\Engine;

$container = new Container();

// Da inserire prima della create di AppFactory
AppFactory::setContainer($container);

$app = AppFactory::create();

//Questa parte deve contenere il percorso della
//sottocartella dove si trova l'applicazione in questo caso inserito nella
//variabile di configurazione BASE_PATH
$app->setBasePath(BASE_PATH);

$container->set('template', function (){
    $engine = new Engine('../templates', 'tpl');
    $engine->addData(['base_path' => BASE_PATH]);
    return $engine;
});

$container->set('images', IMAGES);



// Define Custom Error Handler
$customErrorHandler = function (
    Request $request,
    Throwable $exception,
    bool $displayErrorDetails,
    bool $logErrors,
    bool $logErrorDetails
) use ($app) {
    $payload = ['error' => $exception->getMessage()];

    $response = $app->getResponseFactory()->createResponse();
    $engine = $app->getContainer()->get('template');

    if ($exception instanceof \Slim\Exception\HttpNotFoundException) {
        $response->getBody()->write(
            $engine->render('404', $payload)
        );
    }else{
        $response->getBody()->write(
            "Errore nella pagina"
        );
    }
    return $response;
};

/**
 * Add Error Middleware
 *
 * @param bool                  $displayErrorDetails -> Should be set to false in production
 * @param bool                  $logErrors -> Parameter is passed to the default ErrorHandler
 * @param bool                  $logErrorDetails -> Display error details in error log
 * @param LoggerInterface|null  $logger -> Optional PSR-3 Logger
 *
 * Note: This middleware should be added last. It will not handle any exceptions/errors
 * for middleware added after it.
 */
$errorMiddleware = $app->addErrorMiddleware(true, true, true);
if (MY_ERROR_HANDLER)
    $errorMiddleware->setDefaultErrorHandler($customErrorHandler);

//$app->add($container->get('template')));

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});

$app->get('/hello/{name}', function (Request $request, Response $response, $args) {
    $name = $args['name'];
    $response->getBody()->write('Hello ' . $name);
    return $response;
});


$app->get('/saluti/{name}', function (Request $request, Response $response, $args) {
    $template = $this->get('template');
    $response->getBody()->write($template->render('saluti',
            [
                'name' => $args['name']
            ]
        )
    );
    return $response;
});

$app->get('/carpooling', ProdottoController::class . ':listAll');

$app->get('/carpooling/clienti[/{id}]', ProdottoController::class . ':listAllByGenre');

// Autisti routes
$app->get('/autisti', AutistiController::class . ':index');
$app->get('/autisti/create', AutistiController::class . ':create');
$app->post('/autisti', AutistiController::class . ':store');
$app->get('/autisti/{id}', AutistiController::class . ':show');
$app->get('/autisti/{id}/edit', AutistiController::class . ':edit');
$app->post('/autisti/{id}', AutistiController::class . ':update');
$app->get('/autisti/{id}/delete', AutistiController::class . ':delete');

// Passeggeri routes
$app->get('/passeggeri', PasseggeriController::class . ':index');
$app->get('/passeggeri/create', PasseggeriController::class . ':create');
$app->post('/passeggeri', PasseggeriController::class . ':store');
$app->get('/passeggeri/{id}', PasseggeriController::class . ':show');
$app->get('/passeggeri/{id}/edit', PasseggeriController::class . ':edit');
$app->post('/passeggeri/{id}', PasseggeriController::class . ':update');
$app->get('/passeggeri/{id}/delete', PasseggeriController::class . ':delete');

// Veicoli routes
$app->get('/veicoli', VeicoliControlller::class . ':index');
$app->get('/veicoli/create', VeicoliControlller::class . ':create');
$app->post('/veicoli', VeicoliControlller::class . ':store');
$app->get('/veicoli/{id}', VeicoliControlller::class . ':show');
$app->get('/veicoli/{id}/edit', VeicoliControlller::class . ':edit');
$app->post('/veicoli/{id}', VeicoliControlller::class . ':update');

// Viaggi routes
$app->get('/viaggi', ViaggiController::class . ':index');
$app->get('/viaggi/create', ViaggiController::class . ':create');
$app->post('/viaggi', ViaggiController::class . ':store');
$app->get('/viaggi/{id}', ViaggiController::class . ':show');
$app->get('/viaggi/{id}/edit', ViaggiController::class . ':edit');
$app->post('/viaggi/{id}', ViaggiController::class . ':update');
$app->get('/viaggi/{id}/delete', ViaggiController::class . ':delete');

// Prenotazioni routes
$app->get('/prenotazioni', PrenotazioniController::class . ':index');
$app->get('/prenotazioni/create', PrenotazioniController::class . ':create');
$app->post('/prenotazioni', PrenotazioniController::class . ':store');
$app->get('/prenotazioni/{id}', PrenotazioniController::class . ':show');
$app->get('/prenotazioni/{id}/edit', PrenotazioniController::class . ':edit');
$app->post('/prenotazioni/{id}', PrenotazioniController::class . ':update');

// Feedback Autisti routes
$app->get('/feedback/autisti', FeedbackControlleraut::class . ':index');
$app->get('/feedback/autisti/create', FeedbackControlleraut::class . ':create');
$app->post('/feedback/autisti', FeedbackControlleraut::class . ':store');
$app->get('/feedback/autisti/{id}', FeedbackControlleraut::class . ':show');

// Feedback Passeggeri routes
$app->get('/feedback/passeggeri', FeedbackControllerpas::class . ':index');
$app->get('/feedback/passeggeri/create', FeedbackControllerpas::class . ':create');
$app->post('/feedback/passeggeri', FeedbackControllerpas::class . ':store');
$app->get('/feedback/passeggeri/{id}', FeedbackControllerpas::class . ':show');

$app->run();
