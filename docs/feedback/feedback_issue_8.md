# <https://github.com/richelbilderbeek/bevy_tdd_book/issues/8>

> Feedback from @donedgardo below:
>
> I have had this draft for a while. The thoughts are unorganized,
> and haven’t had the chance to finish reading the book.
>
> But I thought early feedback is better than late.
>
> Introduction:
>
> I believe the focus of 100 percent coverage is not a good reason for TDD.
> Aiming for 100 percent is an ok goal yet it is unachievable
> (Eg You cant have test coverage on main.)

Edgardo has a point here: 100% code coverage is not always
possible. I've changed this:

> [...] always aiming for 100% code coverage whenever possible.

...

> A better reason for adopting TDD is to give developers
> the confidence that their changes work. As a byproduct of this newly
> found confidence, developers deliver value to customers at a high pace with
> minimal bugs. High quality product is the customers value for TDD;
> and high confidence, and easy of adding new features is the value to the
> developer.
>
> Pressing a button that tells you that its ok to deploy the new changes to
> your users confidently, this is what truly is all about.

Edgardo has a point here: the goal of TDD is indeed not a high code coverage.
I've changed the paragraph to state it way my personal goal of the book.

- [ ] Check if indeed 100% code coverage is not mentioned as a goal,
  like Eduardo states here

> 2.3.1
> The reason app has to be mutable is because of the update method.

Changed to:

> 'The Bevy library, however, has good reasons why `App` must be mutable:
> also reading data need to be done in a safe way.'

I feel mentioning the 'update' method does not help the reader

> 2.3.2
> Might benefit to remove the return and semicolon in the implementation to
> keep consistent the rustacian ways. Maybe you can take the opportunity to
> teach about the blue phase, refactoring, after making the test pass.
> I think it would be valuable to show new TDD devs what phase we are at either
> red, green or blue. Color coding each section to get that rhythm of fail,
> pass, clean up.

I corrected the code: Eduardo is right. I wonder why clippy did not fix this, I guess
because it is a test function ...

Color-coding sections seems like a fun idea. I try it out.

- [x] Consider color-coding sections

I've added it to two sections to see how it feels.

> 2.3.4
> I dont like the fact that we just wrote a test that now will fail by
> modifying the create app to add a player. I would create a new test that
> create app doesn’t create a player, and another test where we test where we
> add the new add player system and test it does.
>
> An alternative is to initially test that it has a player from the start,
> and work toward making it pass, and refactor step to make it into its own
> system “add_player”. A concept I think this section is missing is that when
> you are going from red to green you write only enough code to make the test
> pass.
>
> When some is as experienced as us doing TDD we might skip these micro steps
> but for someone just learning I would suggest breaking those down even
> further.

I agree this is indeed quite some code that needs to be added to pass
the test. I considered to indeed make `count_n_players` return `1`
as a stub. The constrain, however, that is on the code it that
all code in the book is tested to be part of the tested projects.
Due to this, adding a stub that is changed away later, will result
in a mismatch between book text and tested project code.

However, I can mention this...

Blimey, the `count_n_players` function is not even mentioned!

> I feel that using create_app function to test individual systems will be
> hard to maintain our test. I suggest separating the app creation and systems
> under different test cases. The create app should just create the app,
> not very valuable tbh. The test to check if it crashes might be a better
> candidate for end to end test instead of an unit test. Thinking more about
> this I think first testing a system is more straightforward that testing
> the if the app crashes or not.

...

> 2.4.1
> As I feared, create app is doing too much and by adding a feature of adding
> player sprite it forces us to change a lot of signatures of test that
> where using create_app.

...

> An idea would be to create a empty app on each test and add the system
> under test, and only those systems to keep test easier to maintain.
> Testing create app where it adds all systems will be hard to maintain,
> especially when systems that depend on third party plugins

...

> 2.4.3
> I think it’s wasteful to add a test that just passes without any change
> requirements of the production code. Maybe im mistaken but the
> count_n_players should already be implemented. I guess what you mean is that
> the call signature if create app has to be modified here.
> :thinking: i would suggest rethinking this section.
> It seem lazy when you say I will not repeat myself here
> but maybe im missing something.

...

> 2.4.5
> An important concept when doing TDD is to write only enough production
> (non-test code) to pass the test. In this section I think you are writing
> more than needed to pass the test. Eg the test don’t care about sprite or
> its transform yet in this section you are writing the code for it.

...

> I see now that you add the test for transorm afterwards which is ok when you
> are experienced, but for a new TDDer you need to break thibgs down in
> really small steps:
>
> - write a list of possible tests
> - pick an easy test
> - write a failing test
> - write enough production code to make it pass
> - clean up removing duplications/refactoring
>
> I believe your audience (new to tdd) would benefit of this breaking down of
> small steps.

