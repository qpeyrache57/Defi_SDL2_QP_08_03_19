program defi;
{$UNITPATH \SDL2}

uses SDL2, SDL2_image, crt;

var
  i, choix : integer;
  sdlWindow1: PSDL_Window;
  sdlRenderer: PSDL_Renderer;
  sdlSurface1: PSDL_Surface;
  sdlTexture1: PSDL_Texture;
  sdlTexture2: PSDL_Texture;
  sdlRectangle: PSDL_Rect;
  sdlHelico_rect : TSDL_Rect;
  sdlAnim: TSDL_Rect;
  exit : boolean = false;
  sdlkeyboardState : PUInt8;





  procedure bitmap;

  begin
    //initialisation du sous-systŠme video
    SDL_Init(SDL_INIT_VIDEO);


    // full set up
    if SDL_CreateWindowAndRenderer(1000, 500, SDL_WINDOW_SHOWN, @sdlWindow1, @sdlRenderer) <> 0 then Halt;

    //creer une surface a partir d'un fichier
    sdlSurface1 := SDL_LoadBMP('Assets\rider.bmp');


    //creer une texture a partir d'une surface
    sdlTexture1 := SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface1);



  //render texture
    SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, nil);

  //render to window for 5 seconds
    SDL_RenderPresent(sdlRenderer);
    SDL_Delay(5000);

    SDL_DestroyTexture(sdlTexture1);
    SDL_FreeSurface(sdlSurface1);
    SDL_DestroyRenderer(sdlRenderer);
    SDL_DestroyWindow(sdlWindow1);
    SDL_Quit;

end;

  procedure dessin;
  begin
  if SDL_Init(SDL_INIT_VIDEO) < 0 then HALT;
  sdlWindow1 := SDL_CreateWindow('Window1', 50, 50, 500, 500, SDL_WINDOW_SHOWN);
  if sdlWindow1 = nil then HALT;
  sdlRenderer := SDL_CreateRenderer (sdlWindow1, -1, 0);
  if sdlRenderer = nil then HALT;

  SDL_SetRenderDrawColor (sdlRenderer, 0, 255, 255, 255);
  SDL_RenderClear (sdlRenderer);
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay (1000);

  SDL_SetRenderDrawColor (sdlRenderer, 255, 0, 0, 255);
  SDL_RenderDrawLine(sdlRenderer, 10, 10, 490, 490);
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay (1000);

  SDL_SetRenderDrawColor (sdlRenderer, 0, 0, 0, 255);
  for i:=0 to 47 do SDL_RenderDrawPoint (sdlRenderer, 490-i*10, 10+i*10);
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay(1000);

  new(sdlRectangle);
  sdlRectangle^.x := 260; sdlRectangle^.y := 10; sdlRectangle^.w := 230; sdlRectangle^.h := 230;
  SDL_SetRenderDrawColor (sdlRenderer, 0, 255, 0, 255);
  SDL_RenderDrawRect (sdlRenderer, sdlRectangle);

  sdlRectangle^.x := 10; sdlRectangle^.y := 260;
  SDL_SetRenderDrawBlendMode (sdlRenderer, SDL_BLENDMODE_BLEND);
  SDL_SetRenderDrawColor (sdlRenderer, 0, 0, 255, 128);
  SDL_RenderFillRect(sdlRenderer, sdlRectangle);
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay(1000);
  end;

  procedure inithelico;
  begin

  SDL_Init(SDL_INIT_VIDEO);

  sdlWindow1 := SDL_CreateWindow ('Window1', 50, 50, 1000, 500, SDL_WINDOW_SHOWN);
  sdlRenderer := SDL_CreateRenderer (sdlWindow1, -1, 0);

  SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, '2');

  sdlTexture2 := IMG_LoadTexture (sdlRenderer, 'Assets\helicopter.png');

  sdlHelico_rect.x := 0;
  sdlHelico_rect.y := 0;
  sdlHelico_rect.w := 128;
  sdlHelico_rect.h := 55;
  sdlAnim.x  := 0;
  sdlAnim.y  := 0;
  sdlAnim.w := 128;
  sdlAnim.h := 55;


   while exit = false do
   begin

        SDL_PumpEvents;
        sdlkeyboardState := SDL_GetkeyboardState(nil);

        if sdlkeyboardState[SDL_SCANCODE_ESCAPE] = 1 then
        exit := true;

  //D‚placements
  if sdlkeyboardState[SDL_SCANCODE_W] = 1 then
     sdlHelico_rect.y := sdlHelico_rect.y -1;
  if sdlkeyboardState[SDL_SCANCODE_A] = 1 then
     sdlHelico_rect.x := sdlHelico_rect.x -1;
  if sdlkeyboardState[SDL_SCANCODE_S] = 1 then
     sdlHelico_rect.y := sdlHelico_rect.y + 1;
  if sdlkeyboardState[SDL_SCANCODE_D] = 1 then
     sdlHelico_rect.x := sdlHelico_rect.x +1;

  sdlAnim.x := sdlAnim.x+128;
   if sdlAnim.x > 512 then
   begin
     sdlAnim.x:=0;
   end;

  SDL_RenderCopy (sdlRenderer, sdlTexture2, @sdlAnim, @sdlHelico_rect);
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay(1);
  SDL_RenderClear(sdlRenderer);
  end;

  //Nettoyer m‚moire
  SDL_DestroyTexture (sdlTexture2);
  SDL_DestroyRenderer (sdlRenderer);
  SDL_DestroyWindow (sdlWindow1);

  //Fermeture SDL
  SDL_Quit;
  end;




//Programme principal
  BEGIN
  clrscr;
  writeln('1 pour afficher le bitmap');
  writeln('2 pour afficher le dessin');
  writeln('3 pour afficher le minijeu');
  writeln('4 pour afficher le difference entre SDL et SDL2');
  readln(choix);
  case choix of
  1 : bitmap();
  2 : dessin();
  3 : inithelico();
  4 : begin
        clrscr;
        writeln('SDL2 est consideree comme une importante mise a jour de SDL');
        writeln('La SDL2 apporte de nombreuses nouveautes et est plus performante que la SDL');
        readln;
      end;
      end;


END.
