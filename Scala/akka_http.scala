import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.stream.Materializer

import scala.concurrent.{ExecutionContext, Future}
import scala.util.{Failure, Success}

object ApiTubeAkkaHttp extends App {
  implicit val system: ActorSystem = ActorSystem("ApiTubeSystem")
  implicit val materializer: Materializer = Materializer(system)
  implicit val executionContext: ExecutionContext = system.dispatcher

  val url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY"

  val responseFuture: Future[HttpResponse] = Http().singleRequest(HttpRequest(uri = url))

  responseFuture.onComplete {
    case Success(response) =>
      response.entity.dataBytes.runFold("")(_ + _.utf8String).foreach { body =>
        if (response.status.isSuccess()) {
          println(body)
        } else {
          println(s"HTTP Request Error: ${response.status}")
        }
        system.terminate()
      }
    case Failure(exception) =>
      println(s"Request failed: ${exception.getMessage}")
      system.terminate()
  }
}
