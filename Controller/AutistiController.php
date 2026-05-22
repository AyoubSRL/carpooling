<?php

namespace Controller;

use Model\AutistiRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class AutistiController
{
    private $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response): Response
    {
        $q = $request->getQueryParams()['q'] ?? '';
        $autisti = trim((string)$q) !== '' ? AutistiRepository::search((string)$q) : AutistiRepository::findAll();

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('autisti/index',
            ['autisti' => $autisti, 'q' => $q]
        ));
        return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
        $autista = AutistiRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('autisti/show',
            ['autista' => $autista]
        ));
        return $response;
    }

    public function create(Request $request, Response $response): Response
    {
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('autisti/create', [
            'base_path' => BASE_PATH
        ]));
        return $response;
    }

    public function store(Request $request, Response $response): Response
    {
        $data = $request->getParsedBody();
        AutistiRepository::create($data);
        return $response->withHeader('Location', BASE_PATH . '/autisti')->withStatus(302);
    }

    public function edit(Request $request, Response $response, array $args): Response
    {
        $autista = AutistiRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('autisti/edit',
            ['autista' => $autista, 'base_path' => BASE_PATH]
        ));
        return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
        $data = $request->getParsedBody();
        AutistiRepository::update($args['id'], $data);
        return $response->withHeader('Location', BASE_PATH . '/autisti/' . $args['id'])->withStatus(302);
    }

    public function delete(Request $request, Response $response, array $args): Response
    {
        try {
            AutistiRepository::delete($args['id']);
            return $response->withHeader('Location', BASE_PATH . '/autisti')->withStatus(302);
        } catch (\Throwable $e) {
            $response->getBody()->write($e->getMessage());
            return $response->withStatus(400);
        }
    }
}