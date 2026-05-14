<?php

namespace Controller;

use Model\FeedbackRespositoryaut;
use Psr\Container\ContainerInterface;
use Slim\Psr7\Request;
use Slim\Psr7\Response;

class FeedbackControlleraut
{
    private $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function index(Request $request, Response $response): Response
    {
        $feedback = FeedbackRespositoryaut::findAll();
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('feedback/index',
            ['feedback' => $feedback, 'type' => 'autisti']
        ));
        return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
        $item = FeedbackRespositoryaut::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('feedback/show',
            ['item' => $item]
        ));
        return $response;
    }

    public function create(Request $request, Response $response): Response
    {
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('feedback/create', ['type' => 'autisti']));
        return $response;
    }

    public function store(Request $request, Response $response): Response
    {
        $data = $request->getParsedBody();
        $data['data_creazione'] = date('Y-m-d H:i:s');
        FeedbackRespositoryaut::create($data);
        return $response->withHeader('Location', '/feedback/autisti')->withStatus(302);
    }

    public function edit(Request $request, Response $response, array $args): Response
    {
        $item = FeedbackRespositoryaut::find($args['id']);
        $engine = $this->container->get('template');
        $response->getBody()->write($engine->render('feedback/edit',
            ['item' => $item]
        ));
        return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
        $data = $request->getParsedBody();
        FeedbackRespositoryaut::update($args['id'], $data);
        return $response->withHeader('Location', '/feedback/autisti/' . $args['id'])->withStatus(302);
    }

    public function delete(Request $request, Response $response, array $args): Response
    {
        FeedbackRespositoryaut::delete($args['id']);
        return $response->withHeader('Location', '/feedback/autisti')->withStatus(302);
    }
}
