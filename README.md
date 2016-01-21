![Build Status](https://codeship.com/projects/b08dc5d0-a228-0133-0466-465166e508dd/status?branch=master)

[![Coverage Status](https://coveralls.io/repos/github/vermartian/toy-chess/badge.svg?branch=master)](https://coveralls.io/github/vermartian/toy-chess?branch=master)

[![Code Climate](https://codeclimate.com/github/vermartian/toy-chess/badges/gpa.svg)](https://codeclimate.com/github/vermartian/toy-chess)

#### Description: ####
  Browser to browser two player chess game using ruby on rails!

##### Objects in Chess: #####
  1. board
  - piece
    - pawn
    - knight
    - bishop
    - rook
    - queen
    - king
  - player
  - game
  - gameplay
  - move
  - (maybe) user separate from player

```
As a user
I want to be able to create a new match,
So that I can invite an opponent to play.

Acceptance Criteria:
* There is an option to create a new match.
```

```
As a user
I want to be able to choose which color I play when creating a new match,
So that I have the opportunity to play with both.

Acceptance Criteria:
* When creating a new match there is an option to select white or black.
```

```
As a user
I want to join a chess match,
So that I can play a game of chess against a human opponent playing on another browser.

Acceptance Criteria:
* There is a list of open games that may be joined.
* Each element in the list is a link to a game.
* Upon joining a game, both players are notified that the game has begun.
```

```
As a player
I want my side of the board to be displayed on the bottom of the page,
So that over the board play is properly simulated.

Acceptance Criteria:
* Upon joining a game, my pieces are displayed on the bottom.
```

```
As a player
I want only to be allowed to make legal moves,
So that I do not have to worry about the rules.

Acceptance Criteria:
* When a legal move is entered the move is reflected on the board.
* When an illegal move is attempted the piece returns to its original position.
```

```
As a player
I want to click on a piece and see all legal moves highlighted on the board
So that I know what options I have.

Acceptance Criteria:
* When a piece is selected its square is highlighted.
* When a piece is selected, all positions that piece may occupy are highlighted.
```

```
As a player
I want my moves reflected on my opponent’s board and my opponent’s moves reflected on my board,
So that I can have a smooth playing experience.

Acceptance Criteria:
* After a player makes a move it is reflected on both player's boards.
```

```
As a player
I want all rules of chess to be implemented correctly, e.g. castling, en passant, etc.,
So that I can play a true game of chess.

Acceptance Criteria:
* All the rules of chess are implemented correctly ;).
```

```
As a prospective user
I want to create an account,
So that I can access the app.
```

```
As an unauthenticated user
I want to sign in,
So that begin new chess games.
```

```
As an authenticated user,
I want to view a list of games,
So that I can choose which one I join.
```

```
As an authenticated user
I want to sign out,
So that no one else can play on my behalf.
```

```
As an authenticated user
I want to update my information,
So that I can keep my profile up to date.
```

```
As an authenticated user,
I want to delete my account,
So that my information is no longer retained by the app.
```

```
As an authenticated user,
I want to be able to view my past games on a chessboard
So I can see them played out.
```

```
As an authenticated user,
I want to update my games with comments,
So I can summarize the match, make note of significant moves, etc.
```

```
As an authenticated user,
I want to track my number of wins and losses with each color.
So that I can see how I've played with each.
```
