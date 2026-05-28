<?php

namespace Controller;

use Model\ViaggiRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class ViaggiController
{
    private $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }
    public function index(Request $request, Response $response): Response
    {
        $q = $request->getQueryParams()['q'] ?? '';
        $viaggi = trim((string)$q) !== '' ? ViaggiRepository::search((string)$q) : ViaggiRepository::findAll();

        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('viaggi/index',
            ['viaggi' => $viaggi, 'base_path' => BASE_PATH, 'q' => $q]
        ));
        return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
        $viaggio = ViaggiRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('viaggi/show',
            ['viaggio' => $viaggio]
        ));
        return $response;
    }

    public function create(Request $request, Response $response): Response
    {
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('viaggi/create', [
            'base_path' => BASE_PATH
        ]));
        return $response;
    }

    public function store(Request $request, Response $response): Response
    {
        $data = $request->getParsedBody();
        ViaggiRepository::create($data);
        return $response->withHeader('Location', BASE_PATH . '/viaggi')->withStatus(302);
    }

    public function edit(Request $request, Response $response, array $args): Response
    {
        $viaggio = ViaggiRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('viaggi/edit',
            ['viaggio' => $viaggio, 'base_path' => BASE_PATH]
        ));
        return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
        $data = $request->getParsedBody();
        ViaggiRepository::update($args['id'], $data);
        return $response->withHeader('Location', BASE_PATH . '/viaggi/' . $args['id'])->withStatus(302);
    }

    public function delete(Request $request, Response $response, array $args): Response
    {
        ViaggiRepository::delete($args['id']);
        return $response->withHeader('Location', BASE_PATH . '/viaggi')->withStatus(302);
    }
}
