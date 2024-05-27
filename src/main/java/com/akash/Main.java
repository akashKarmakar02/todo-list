package com.akash;

import com.amberj.net.httpserver.Server;
import com.amberj.net.template.Data;

import java.io.IOException;
import java.util.ArrayList;

public class Main {

    record Todo(
            String task,
            boolean isCompleted
    ) {}
    public static void main(String[] args) throws IOException {
        var server = new Server(8000);
        var todos = new ArrayList<Todo>();

        server.get("/", (request, response) -> {
            response.render("index", new Data()
                    .with("todos", todos));
        });

        server.post("/", (request, response) -> {
            var body = request.body();
            todos.add(new Todo((String) body.get("task"), false));

            response.redirect("/");
        });

        server.run();
    }
}