<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <title>Голосование</title>
</head>

<body>

    <div class="container my-lg-4">
        <div>
            <h3>Проголосуйте</h3>
        </div>
        <div class="my-lg-4">
            <button type="button" class="btn btn-primary btn-lg" onclick="to_vote('cats')">Коты лучшие</button>
            <button type="button" class="btn btn-secondary btn-lg" onclick="to_vote('dogs')">Только собаки!!!</button>
            <button type="button" class="btn btn-success btn-lg" onclick="to_vote('parrots')">Топим за попугаев</button>
        </div>
        <p class="result_vote"></p>
        <div>
            <h6><a href="/stat/">Посмотреть результаты голосования</a></h6>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <script>
        const url_ = new URL('https://sf-pyw.mosyag.in/sse/vote')
        const result_vote = document.querySelector('.result_vote')

        async function to_vote(person) {
            fetch(url_ + '/' + person, {method: 'POST'})
              .then(response => response.json())
              .then(result => result_vote.innerText = result.message)
        }
    </script>

</body>
</html>