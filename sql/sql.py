"""SQL expression evaluator."""

import readline
from sql_exec import execute
from sqlite3 import complete_statement
from ucb import main

PROMPT = 'SQL> '

def sql_read(readline=input):
    statement = readline(PROMPT)
    if statement in (".quit", ".exit"):
        raise EOFError
    while not complete_statement(statement):
        statement += readline(' ' * len(PROMPT))
    return statement.strip()

def read_file(filename):
    """Return a function that reads from the named file."""

    def readline(prompt):
        """Return a non-empty line."""
        line = ""
        while not line.strip():
            line = next(f)
        print(prompt + line, end="")
        return line

    f = open(filename, 'r')
    return lambda: sql_read(readline)

def print_rows(rows):
    """Print rows of output, one per line."""
    for row in rows:
        print("|".join(str(value) for value in row))

def read_eval_print_loop(read):
    """Run a read-eval-print loop for SQL."""
    while True:
        try:
            statement = read()
            if statement:
                print_rows(execute(statement))
        except (AssertionError, NameError, SyntaxError) as e:
            print(e)
        except (KeyboardInterrupt, EOFError, StopIteration): # <Control>-D, etc
            return

@main
def start(filename=None, flag=None):
    if filename:
        read_eval_print_loop(read_file(filename))
    read_eval_print_loop(sql_read)
