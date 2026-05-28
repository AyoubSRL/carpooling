<?php

namespace Controller;

use Model\PrenotazioniRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class PrenotazioniController
{
    private $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }
    public function index(Request $request, Response $response): Response
    {
        $q = $request->getQueryParams()['q'] ?? '';
        $prenotazioni = trim((string)$q) !== '' ? PrenotazioniRepository::search((string)$q) : PrenotazioniRepository::findAll();

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('prenotazioni/index',
            ['prenotazioni' => $prenotazioni, 'q' => $q]
        ));
        return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
        $prenotazione = PrenotazioniRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('prenotazioni/show',
            ['prenotazione' => $prenotazione]
        ));
        return $response;
    }

    public function create(Request $request, Response $response): Response
    {
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('prenotazioni/create', [
            'base_path' => BASE_PATH
        ]));
        return $response;
    }

    public function store(Request $request, Response $response): Response
    {
        $data = $request->getParsedBody();
        PrenotazioniRepository::create($data);
        return $response->withHeader('Location', BASE_PATH . '/prenotazioni')->withStatus(302);
    }

    public function edit(Request $request, Response $response, array $args): Response
    {
        $prenotazione = PrenotazioniRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('prenotazioni/edit',
            ['prenotazione' => $prenotazione, 'base_path' => BASE_PATH]
        ));
        return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
        $data = $request->getParsedBody();
        PrenotazioniRepository::update($args['id'], $data);
        return $response->withHeader('Location', BASE_PATH . '/prenotazioni/' . $args['id'])->withStatus(302);
    }

    public function delete(Request $request, Response $response, array $args): Response
    {
        PrenotazioniRepository::delete($args['id']);
        return $response->withHeader('Location', BASE_PATH . '/prenotazioni')->withStatus(302);
    }
}
