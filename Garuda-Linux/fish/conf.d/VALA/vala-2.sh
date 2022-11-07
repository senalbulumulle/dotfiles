                                touch main.vala
                                echo """
/******************************************
 *
 *      ------Title------
 *
 *
 *
 *
 *
 *      ------Author-----
 *
 *
 *
 *
 *
 *
 *     -----Description---
 *
 *******************************************/

void userInput() {
        stdout.printf (" ");
        string prompt = stdin.read_line ();
        if (prompt != null) {
                stdout.printf ("Here is what you entered:, %s!\n", prompt);
        }
}


void main() {
        print("hello world");
}
                                """ >> main.vala

micro main.vala
