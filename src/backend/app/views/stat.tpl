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
        <div class="my-lg-4">
            <h2>Результаты голосования</h2>
        </div>
        <section class="mt-5 justify-content-center">
            <div class="alert alert-primary" role="alert">
                <p class="h3">Коты: <span class="cats_stat h4"></span></p>
            </div>
            <div class="alert alert-primary" role="alert">
                <p class="h3">Собаки: <span class="dogs_stat h4"></span></p>
            </div>
            <div class="alert alert-primary" role="alert">
                <p class="h3" >Попугаи: <span class="parrots_stat h4"></span></p>
            </div>
        </section>
        <div class="my-lg-4">
            <h6><a href="/">вернуться на главную</a></h6>
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
        const progress_cats = document.querySelector('.cats_stat')
        const progress_dogs = document.querySelector('.dogs_stat')
        const progress_parrots = document.querySelector('.parrots_stat')

        const header = new Headers({
            'Access-Control-Allow-Credentials': true,
            'Access-Control-Allow-Origin': '*'
        })

        const url = new URL('https://sf-pyw.mosyag.in')
        const url_stat = new URL('https://sf-pyw.mosyag.in/sse/vote/stats')

        const ES = new EventSource(url_stat, header)

        ES.onerror = error => {
            ES.readyState ? progress.textContent = "Some error" : null;
        }

        ES.onmessage = message => {
            let mess = JSON.parse(message.data);

            const cats_stat = mess['cats'];
            const dogs_stat = mess['dogs'];
            const parrots_stat = mess['parrots'];
            progress_cats.innerText = `${cats_stat}`;
            progress_dogs.innerText = `${dogs_stat}`;
            progress_parrots.innerText = `${parrots_stat}`;

        }

    </script>
</body>

</html>