# Elixir User System
## Description
A Phoenix web application that allows users to register and login. I'm making this application to practice Elixir, a functional programming language I'm learning.

This project uses [Argon2](https://hexdocs.pm/argon2_elixir/Argon2.html) for password hashing.

## Installation
1. Install a PostgreSQL server.

2. Modify your environment config in `config/<env>.exs` and configure the PostgreSQL details.

3. Install dependencies by running `mix deps.get`.

4. Create database by running `mix ecto.create`.

5. Migrate necessary schemas by running `mix ecto.migrate`.

6. Run the web server by running `mix phx.server`.

**Note** - By default, the web server binds to port `4000`. Therefore, if you're using localhost, you can access the page at http://localhost:4000/.

## Credits
* [Christian Deacon](https://www.linkedin.com/in/christian-deacon-902042186/)