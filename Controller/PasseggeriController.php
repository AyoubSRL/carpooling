<?php

namespace Controller;

use Model\PasseggeriRepository;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class PasseggeriController
{
    private $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response): Response
    {
        $passeggeri = PasseggeriRepository::findAll();
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('passeggeri/index',
            ['passeggeri' => $passeggeri]
        ));
        return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
        $passeggero = PasseggeriRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('passeggeri/show',
            ['passeggero' => $passeggero]
        ));
        return $response;
    }

    public function create(Request $request, Response $response): Response
    {
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('passeggeri/create'));
        return $response;
    }

    public function store(Request $request, Response $response): Response
    {
        $data = $request->getParsedBody();
        PasseggeriRepository::create($data);
        return $response->withHeader('Location', '/passeggeri')->withStatus(302);
    }

    public function edit(Request $request, Response $response, array $args): Response
    {
        $passeggero = PasseggeriRepository::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('passeggeri/edit',
            ['passeggero' => $passeggero]
        ));
        return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
        $data = $request->getParsedBody();
        PasseggeriRepository::update($args['id'], $data);
        return $response->withHeader('Location', '/passeggeri/' . $args['id'])->withStatus(302);
    }

    public function delete(Request $request, Response $response, array $args): Response
    {
        PasseggeriRepository::delete($args['id']);
        return $response->withHeader('Location', '/passeggeri')->withStatus(302);
    }
}