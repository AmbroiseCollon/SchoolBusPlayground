/*: 
⬇️ *Vous pouvez ignorez le code ci-dessous, il nous permet juste d'initialiser et de visualiser le canva à droite.*
 */
import PlaygroundSupport
let canva = Canva()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = canva

/*:
 - - -
 # Découverte du canva
 Le canva, c'est l'étendue de pelouse verte qui se trouve sur la droite 🌿.
 Sur ce canva, nous allons pouvoir dessiner notre route. Et nous allons faire cela en utilisant les fonctions proposées par le canva :
 ## Route

 `canva.createRoadSection()`
 - 🛣 Cette fonction permet de **créer une section de route**. A chaque appel de cette fonction, une nouvelle section de route est crée.

 `canva.createHomeRoadSection()`
 - 🛣🏠 Similaire à la précédente, cette fonction permet de créer une section de route **qui contient une maison**.
 
 `canva.createSchoolRoadSection()`
 - 🛣🏫 Similaire à la précédente, cette fonction permet de créer une section de route **qui contient une école**.
 
 ## Bus
 `canva.moveBusForward()`

 - 🚌➡️ Cette fonction permet d'avancer le bus jusqu'à la section de route suivante. Attention, le bus ne peut pas avancer si il n'y a plus de route devant lui.
 
 `canva.stopBus()`
 - 🚌🛑 Cette fonction permet de faire marquer à un arrêt au bus.
 
 ## A vous de jouer !
 */

