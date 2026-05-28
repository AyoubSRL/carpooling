Sei Claude Code. Hai accesso al progetto PHP Slim in c:\Users\79841033\Desktop\Xampp Test\xampp\htdocs\carPoolingSlim-ACB. Obiettivo: completare template, model e controller in modo che il comportamento e la struttura corrispondano ai file di riferimento "master-example/template-slim" (branch master).

Contesto tecnico e vincoli
- Framework: Slim PHP (versione usata nel repo).
- DB: usare PDO tramite il container o la proprietà già presente ($this->db).
- Templates: motore Slim/Twig/Slim-Views con file .slim (layout master con blocchi `title`, `content`, `scripts`).
- Linguaggio: PHP. Prepared statements obbligatori per query.
- Nomi e firme: mantenere nomi metodi e variabili come nell'esempio master per compatibilità con le view e le route.
- Sicurezza: includere CSRF token nei form, gestire errori di validazione e mostrare errori nei template.
- Test manuale: fornire comandi Windows per installare e avviare: `composer install` e `php -S localhost:8000 -t public`,

Attività richieste (output atteso da te)
1) Piano sintetico in 3 step per implementazione.
2) Elenco preciso dei file da creare/modificare (path relativi al repo).
3) Per ogni file: breve descrizione delle modifiche e le firme dei metodi richiesti.
4) Fornire patch o file completi da inserire (mostra il contenuto dei file nuovi/aggiornati).
5) Checklist di accettazione e comandi per testare localmente.

Dettagli tecnici richiesti nei file
- Models (src/Model/*): implementare almeno i metodi: findAll(), find($id), create(array $data), update($id, array $data), delete($id). Ritornare array associativi.
- Controllers (src/Controller/*): implementare azioni standard: index(Request, Response), show(Request, Response, array $args), create(Request, Response), store(Request, Response), edit(Request, Response, array $args), update(Request, Response, array $args), delete(Request, Response, array $args). Iniettare renderer, models e db dal container.
- Templates (templates/): creare/adeguare layout/master.slim con blocchi `title`, `content`, `scripts` e view per index/show/create/edit per le risorse principali (es. Ride, Booking, User). I template devono usare le stesse variabili passate dal controller e includere blocco di rendering degli errori di validazione e CSRF fields.

Criteri di accettazione
- Le rotte in routes.php mappano correttamente ai controller.
- Le view ricevono le variabili previste e si renderizzano senza errori fatali.
- I model eseguono query parametrizzate e funzionano con i controller.
- Funzionalità CRUD principali verificabili via browser su localhost:8000.
- Fornire elenco dei file modificati e una breve nota di testing per ciascuno.

Formato di risposta richiesto da te (Claude Code)
- Step 1: piano in 3 step.
- Step 2: elenco file da creare/modificare.
- Step 3: per ogni file, mostra il contenuto (full file) pronto da copiare.
- Step 4: checklist di accettazione e comandi di test su Windows.
- Fornisci risposte in italiano e mantieni le modifiche minime necessarie per raggiungere compatibilità con il repo di riferimento.

Non fare assunzioni non dichiarate: se serve un file di esempio specifico da "master-example/template-slim", chiedi quale file con path esatto