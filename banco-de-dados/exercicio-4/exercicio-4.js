// Exercício 4: Não relacional (consultas avançadas) - banco "blog"
// Usa a coleção posts do Exercício 3.

// 1. updateOne: adiciona "comentarios" (array de documentos) a um post
db.posts.updateOne(
  { titulo: "Schema flexível na prática" },
  {
    $set: {
      comentarios: [
        { usuario: "Carla", texto: "Explicação muito clara!", data: new Date("2026-11-10") },
        { usuario: "Diego", texto: "Ótimo para quem está começando.", data: new Date("2026-11-11") }
      ]
    }
  }
)

// 2. find: posts com a tag "nosql" (consulta dentro de um array)
db.posts.find({ tags: "nosql" })

// 3. find: posts de um autor específico
db.posts.find({ autor: "Ana Costa" })

// EXTRA: consulta dentro de documentos aninhados (array de documentos)
db.posts.find({ "comentarios.usuario": "Carla" })
