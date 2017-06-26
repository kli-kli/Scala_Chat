package com

import akka.actor.ActorSystem

/**
  * Created by Tigra on 26.06.2017.
  */
class Barista extends App {
  val system = ActorSystem("Barista")
  system.shutdown()
}
