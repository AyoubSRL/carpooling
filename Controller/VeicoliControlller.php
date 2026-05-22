<?php

namespace Controller;

use Model\VeicoliRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class VeicoliControlller
{
    private $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response): Response
    {
        $q = $request->getQueryParams()['q'] ?? '';
        $veicoli = trim((string)$q) !== '' ? VeicoliRepository::search((string)$q) : VeicoliRepository::findAll();

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('veicoli/index',
            ['veicoli' => $veicoli, 'q' => $q]
        ));
        return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
        $veicolo = VeicoliRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('veicoli/show',
            ['veicolo' => $veicolo]
        ));
        return $response;
    }

    public function create(Request $request, Response $response): Response
    {
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('veicoli/create', [
            'base_path' => BASE_PATH
        ]));
        return $response;
    }

    public function store(Request $request, Response $response): Response
    {
        $data = $request->getParsedBody();
        VeicoliRepository::create($data);
        return $response->withHeader('Location', BASE_PATH . '/veicoli')->withStatus(302);
    }

    public function edit(Request $request, Response $response, array $args): Response
    {
        $veicolo = VeicoliRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('veicoli/edit',
            ['veicolo' => $veicolo, 'base_path' => BASE_PATH]
        ));
        return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
        $data = $request->getParsedBody();
        VeicoliRepository::update($args['id'], $data);
        return $response->withHeader('Location', BASE_PATH . '/veicoli/' . $args['id'])->withStatus(302);
    }

    public function delete(Request $request, Response $response, array $args): Response
    {
        VeicoliRepository::delete($args['id']);
        return $response->withHeader('Location', BASE_PATH . '/veicoli')->withStatus(302);
    }
}