# Name That Number

You may be familiar with American adverts on television where they convert their telephone numbers into words and add a jingle to them so they can annoyingly sing them to you in a cheesy tune. You can find more about the numbers associated with each number here4. The challenge is to create a program that can take a phone number such as 0800-TOP-ODIN and convert it to the telephone number equivalent 0800-807-6346.

Example inputs and outputs

Input: "0100-AWE-SOME"
Output: “0100-293-7663”

Input: "0946-LUV-CODE"
Output: “0946-588-2633”

Optional Extensions:
Can you extend your program so that only words in the dictionary are allowed?

You can either tap into an api or if you aren’t confident doing that download a file containing all the words at a place such as this

For the extension you can throw an error or return a nil/null value for a word that isn’t in the dictionary

Example inputs and outputs

Input: "0345-DOG-TAIL"
Output: “0345-364-8245” - because both ‘dog’ and ‘tail’ are both words you would find in the dictionary

Input "0230-XYZ-GTOE"
Output: Error or Nil/Null - as ‘xyz’ and ‘gtoe’ would not be found in a dictionary

As the aim is to make these language agnostic we don’t provide a test suite to run these against but encourage you to write tests yourself for the practice.
[More info.](https://forum.theodinproject.com/t/name-that-number/986)
