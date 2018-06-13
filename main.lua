---- Jogo da Velha ----
jogador = " "
placarX = 0
placarO = 0
quantidadaJogadas = 0


tabuleiroJogadas = {{" "," "," "},
			       {" "," "," "},
                   {" "," "," "}}

local myText = display.newText( "Jogo da Velha", 170, 0, native.systemFont, 32)
myText:setFillColor(1,0,0)

function mudarJogador()
    if(jogador=="X") then
        jogador="O"
    else
        jogador="X"
    end
end

function validarJogada()
    if(quantidadaJogadas < 9) then
        verificarVitoria()
	else
		empate()
	end
end

function verificarVitoria()
	if(tabuleiroJogadas[1][1] ~= " " and tabuleiroJogadas[1][1] == tabuleiroJogadas[1][2]
		and tabuleiroJogadas[1][2] == tabuleiroJogadas[1][3])then
		vencedor()
	elseif(tabuleiroJogadas[2][1] ~= " " and tabuleiroJogadas[2][1] == tabuleiroJogadas[2][2]
			and tabuleiroJogadas[2][2] == tabuleiroJogadas[2][3]) then
		vencedor()
	elseif (tabuleiroJogadas[3][1] ~= " " and tabuleiroJogadas[3][1] == tabuleiroJogadas[3][2]
			and tabuleiroJogadas[3][2] == tabuleiroJogadas[3][3]) then
		vencedor()
	elseif(tabuleiroJogadas[1][1] ~= " " and tabuleiroJogadas[1][1] == tabuleiroJogadas[2][1]
			and tabuleiroJogadas[2][1] == tabuleiroJogadas[3][1]) then
		vencedor()
	elseif(tabuleiroJogadas[1][2] ~=" " and tabuleiroJogadas[1][2] == tabuleiroJogadas[2][2]
			and tabuleiroJogadas[2][2] == tabuleiroJogadas[3][2]) then
		vencedor()
	elseif(tabuleiroJogadas[1][3] ~= " " and tabuleiroJogadas[1][3] == tabuleiroJogadas[2][3]
			and tabuleiroJogadas[2][3] == tabuleiroJogadas[3][3]) then
		vencedor()
	elseif(tabuleiroJogadas[1][1] ~= " " and tabuleiroJogadas[1][1] == tabuleiroJogadas[2][2]
			and tabuleiroJogadas[2][2] == tabuleiroJogadas[3][3]) then
		vencedor()
	elseif(tabuleiroJogadas[3][1] ~= " " and tabuleiroJogadas[3][1] == tabuleiroJogadas[2][2]
			and tabuleiroJogadas[2][2] == tabuleiroJogadas[1][3]) then
		vencedor()
	end
	
end


function limparTabuleiro()
   tabuleiroJogadas = {{" "," "," "},
                       {" "," "," "},
                       {" "," "," "}}

    limparRetangulo2 = display.newRect(100,230,410,280)
    limparRetangulo2.strokeWidth = 0
    limparRetangulo2:setFillColor( 0 )
    limparRetangulo2:setStrokeColor(0 , 0 ,0 )
    quantidadaJogadas = 0
    tabuleiro()
end


function novoJogo()
    limparRetangulo2 = display.newRect(200,280,4600,300)
    limparRetangulo2.strokeWidth = 0
    limparRetangulo2:setFillColor( 0 )
    limparRetangulo2:setStrokeColor(0 , 0 ,0 )

    local myText = display.newText( "Deseja jogar novamente: ", 165, 160, native.systemFont, 20 )
    myText:setFillColor(1,1,1)

    retanguloSim = display.newRect(100,230,130,50)

    function retanguloSim:touch( event )
        if event.phase == "ended" then
            --[[mudarJogador()
            limparTabuleiro()]]
			inicioJogo()
            return true
        end
    end
    retanguloSim:addEventListener( "touch", retanguloSim)

    retanguloNao = display.newRect(237,230,130,50)
	
    function retanguloNao:touch( event )
        if event.phase == "ended" then
            --inicioJogo() 
			limparRetangulo2 = display.newRect(200,200,4600,300)
			limparRetangulo2.strokeWidth = 0
			limparRetangulo2:setFillColor( 0 )
			limparRetangulo2:setStrokeColor(0 , 0 ,0 )
			
			local myText = display.newText( "Fim de Jogo...", 170, 260, native.systemFont, 20 )
			myText:setFillColor(1,0,0)
            return true
        end
    end
    retanguloNao:addEventListener( "touch", retanguloNao)

    local textSim = display.newText( "SIM", 100, 234, native.systemFont, 18)
    textSim:setFillColor(1,0,0)

    local textNao = display.newText( "N�O", 240, 234, native.systemFont, 18)
    textNao:setFillColor(1,0,0)

end

function vencedor()
	novoJogo()
    local myText = display.newText( "Parabens o jogador "..jogador.." venceu!", 170, 100, native.systemFont, 20 )
    myText:setFillColor(1,0,0)
end

function empate()
	novoJogo()
    local myText = display.newText( "Jogo Empatado!!", 170, 100, native.systemFont, 20 )
    myText:setFillColor(1,0,0)
end

function Jogada1(jogador)
    if(tabuleiroJogadas[1][1]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 80, 220, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[1][1] = jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()

        else
            local Vertical1 = display.newLine( 50, 190, 115, 255)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0)

            local Vertical1 = display.newLine( 115, 190, 50, 255)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            tabuleiroJogadas[1][1] = jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()

        end
    end
end

function Jogada2(jogador)
    if(tabuleiroJogadas[1][2]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 160, 220, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[1][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
--- ok
	   else
            local Vertical1 = display.newLine( 200,260, 120, 190)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            local Vertical1 = display.newLine(120 ,260, 200, 190)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            tabuleiroJogadas[1][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
			
        end
    end
end

function jogada3(jogador)
    if (tabuleiroJogadas[1][3]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 240, 220, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[1][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
-- ok
        else
            local Vertical1 = display.newLine( 200, 180, 280, 260)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

			local Vertical1 = display.newLine( 280, 180, 200, 260)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            tabuleiroJogadas[1][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()

        end
    end
end

function jogada4(jogador)
    if (tabuleiroJogadas[2][1]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 80, 300, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[2][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        else
            local Vertical1 = display.newLine( 50, 335, 115, 270)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0, 0 )

            local Vertical1 = display.newLine( 115, 335, 50, 270)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0, 0 )

            tabuleiroJogadas[2][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
	--ok
        end
    end
end


function jogada5(jogador)
    if (tabuleiroJogadas[2][2]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 160, 300, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[2][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        else
            local Vertical1 = display.newLine( 128, 335, 200, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            local Vertical1 = display.newLine( 200, 335, 128, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            tabuleiroJogadas[2][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        end
    end
end

function jogada6(jogador)
    if (tabuleiroJogadas[2][3]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 240, 300, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[2][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        else
            local Vertical1 = display.newLine( 210, 335, 280, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            local Vertical1 = display.newLine( 280, 335, 210, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            tabuleiroJogadas[2][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        end
    end
end

function jogada7(jogador)
    if (tabuleiroJogadas[3][1]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 80,380, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[3][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()

        else
		-- 											    dir
            local Vertical1 = display.newLine( 50, 415, 115, 350)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            local Vertical1 = display.newLine( 115, 415, 50, 350)
            Vertical1.strokeWidth = 4

  		    Vertical1:setStrokeColor(1 , 0 ,0 )
            tabuleiroJogadas[3][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()

        end
    end
end

function jogada8(jogador)
    if (tabuleiroJogadas[3][2]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 160,380, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[3][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        else
        --
            local Vertical1 = display.newLine( 130, 415, 195, 350)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            local Vertical1 = display.newLine( 195, 415, 130, 350)

            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )


            tabuleiroJogadas[3][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        end
    end
end

function jogada9(jogador)
    if (tabuleiroJogadas[3][3]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 240,380, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[3][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        else
            local Vertical1 = display.newLine( 210, 415, 280, 345)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            local Vertical1 = display.newLine( 280, 415, 210, 345)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 0 ,0 )

            tabuleiroJogadas[3][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            validarJogada()
            mudarJogador()
        end
    end
end

function indices()
    local indice1 = display.newRect( 80,140, 70, 70 )
    indice1.strokeWidth = 3
    indice1:setFillColor( 0 )
    indice1:setStrokeColor( 0, 0, 0 )

    function indice1:touch( event )
        if event.phase == "ended" then
            Jogada1(jogador)
            return true
        end
    end
    indice1:addEventListener( "touch",indice1)

    local indice2 = display.newRect( 160,140, 70, 70 )
    indice2.strokeWidth = 3
    indice2:setFillColor( 0 )
    indice2:setStrokeColor( 0, 0, 0 )

    function indice2:touch( event )
        if event.phase == "ended" then
            Jogada2(jogador)
            return true
        end
    end

    indice2:addEventListener( "touch",indice2)

    local indice3 = display.newRect( 240,140, 70, 70 )
    indice3.strokeWidth = 3
    indice3:setFillColor( 0 )
    indice3:setStrokeColor( 0, 0, 0 )

    function indice3:touch( event )
        if event.phase == "ended" then
            jogada3(jogador)
            return true
        end
    end
    indice3:addEventListener( "touch",indice3)

    local indice4 = display.newRect( 80,220, 70, 70 )
    indice4.strokeWidth = 3
    indice4:setFillColor( 0 )
    indice4:setStrokeColor( 0, 0, 0 )

    function indice4:touch( event )
        if event.phase == "ended" then
            jogada4(jogador)
            return true
        end
    end
    indice4:addEventListener( "touch",indice4)

    local indice5 = display.newRect( 160,220, 70, 70 )
    indice5.strokeWidth = 3
    indice5:setFillColor( 0 )
    indice5:setStrokeColor( 0, 0, 0 )

    function indice5:touch( event )
        if event.phase == "ended" then
            jogada5(jogador)
            return true
        end
    end
    indice5:addEventListener( "touch",indice5)

    local indice6 = display.newRect( 240,220, 70, 70 )
    indice6.strokeWidth = 3
    indice6:setFillColor( 0 )
    indice6:setStrokeColor( 0, 0, 0 )

    function indice6:touch( event )
        if event.phase == "ended" then
            jogada6(jogador)
            return true
        end
    end
    indice6:addEventListener( "touch",indice6)


    -- 3 Linha

    local indice7 = display.newRect( 80,300, 70, 70 )
    indice7.strokeWidth = 3
    indice7:setFillColor( 0 )
    indice7:setStrokeColor( 0, 0, 0 )

    function indice7:touch( event )
        if event.phase == "ended" then
            jogada7(jogador)
            return true
        end
    end
    indice7:addEventListener( "touch",indice7)

    local indice8 = display.newRect( 160,300, 70, 70 )
    indice8.strokeWidth = 3
    indice8:setFillColor( 0 )
    indice8:setStrokeColor( 0, 0, 0 )

    function indice8:touch( event )
        if event.phase == "ended" then
            jogada8(jogador)
            return true
        end
    end
    indice8:addEventListener( "touch",indice8)


    local indice9  = display.newRect( 240,300, 70, 70 )
    indice9.strokeWidth = 3
    indice9:setFillColor( 0)
    indice9:setStrokeColor( 0, 0, 0 )

    function indice9:touch( event )
        if event.phase == "ended" then
            jogada9(jogador)
            return true
        end
    end
    indice9:addEventListener( "touch",indice9)

end

function inicioJogo()
    limparRetangulo = display.newRect(100,230,410,280)
    limparRetangulo.strokeWidth = 0
    limparRetangulo:setFillColor( 0 )
    limparRetangulo:setStrokeColor(0 , 0 ,0 )

    limparPontuacao = display.newRect(20,430,600,80)
    limparPontuacao.strokeWidth = 4
    limparPontuacao:setFillColor( 0 )
    limparPontuacao:setStrokeColor( 0, 0, 0 )

    jogador = " "
    quantidadaJogadas = 0


    tabuleiroJogadas = {{" "," "," "},
                       {" "," "," "},
                       {" "," "," "}}


    retanguloO = display.newRect(237,130,130,50)
    retanguloO.strokeWidth = 4
    retanguloO:setFillColor( 1,1,1 )
    retanguloO:setStrokeColor( 1, 0, 0 )
    function retanguloO:touch( event )
        if event.phase == "ended" then
            jogador="O"
			limparBotoes()
            return true
        end
    end

    retanguloO:addEventListener( "touch",retanguloO)


    local myCircle = display.newCircle( 237,130, 15, 15 )
    myCircle:setFillColor( 1 )
    myCircle.strokeWidth = 9
    myCircle:setStrokeColor( 1, 0 ,0 )


    --X
    retanguloX = display.newRect(100,130,130,50)
    retanguloX.strokeWidth = 4
    retanguloX:setFillColor( 1,1,1 )
    retanguloX:setStrokeColor( 1, 0, 0 )

    function retanguloX:touch( event )
        if event.phase == "ended" then
            jogador="X"
            limparBotoes()
            return true
        end
    end
    retanguloX:addEventListener( "touch",retanguloX)

    local Vertical1 = display.newLine( 110, 150, 90, 110)
    Vertical1.strokeWidth = 9
    Vertical1:setStrokeColor(1 , 0 ,0 )

    local Vertical2 = display.newLine(  90, 150, 110, 110)
    Vertical2.strokeWidth = 9
    Vertical2:setStrokeColor(1 , 0 ,0 )

end


function limparBotoes()
    limparRetangulo = display.newRect(100,230,410,280)
    limparRetangulo.strokeWidth = 0
    limparRetangulo:setFillColor( 0 )
    limparRetangulo:setStrokeColor( 1, 0 ,0 )

	tabuleiro()
	indices()
end


function tabuleiro()
    local linhaVertical1 = display.newLine( 200, 415, 200, 185)
	linhaVertical1.strokeWidth = 09

    local linhaVertical2 = display.newLine( 120, 415, 120, 185)
    linhaVertical2.strokeWidth = 9

    local linhaHorizontal1 = display.newLine( 43, 260, 277, 260 )
    linhaHorizontal1.strokeWidth = 9

    local linhaHorizontal2= display.newLine( 43, 340, 277, 340 )
    linhaHorizontal2.strokeWidth = 009

end

function indices()
    local indice1 = display.newRect( 80,220, 70, 70 )
    indice1.strokeWidth = 3
    indice1:setFillColor( 0 )
    indice1:setStrokeColor( 0, 0, 0 )

    function indice1:touch( event )
        if event.phase == "ended" then
            Jogada1(jogador)
            return true
        end
    end

    indice1:addEventListener( "touch",indice1)


    local indice2 = display.newRect( 160,220, 70, 70 )
    indice2.strokeWidth = 3
    indice2:setFillColor( 0 )
    indice2:setStrokeColor( 0, 0, 0 )

    function indice2:touch( event )
        if event.phase == "ended" then
            Jogada2(jogador)
            return true
        end
    end

    indice2:addEventListener( "touch",indice2)

    local indice3 = display.newRect( 240,220, 70, 70 )
    indice3.strokeWidth = 3
    indice3:setFillColor( 0 )
    indice3:setStrokeColor( 0, 0, 0 )

    function indice3:touch( event )
        if event.phase == "ended" then
            jogada3(jogador)
            return true
        end
    end

    indice3:addEventListener( "touch",indice3)

    local indice4 = display.newRect( 80,300, 70, 70 )
    indice4.strokeWidth = 3
    indice4:setFillColor( 0 )
    indice4:setStrokeColor( 0, 0, 0 )

    function indice4:touch( event )
        if event.phase == "ended" then
            jogada4(jogador)
            return true
        end
    end
    indice4:addEventListener( "touch",indice4)

    local indice5 = display.newRect( 160,300, 70, 70 )
    indice5.strokeWidth = 3
    indice5:setFillColor( 0 )
    indice5:setStrokeColor( 0, 0, 0 )

    function indice5:touch( event )
        if event.phase == "ended" then
            jogada5(jogador)
            return true
        end
    end
    indice5:addEventListener( "touch",indice5)

    local indice6 = display.newRect( 240,300, 70, 70 )
    indice6.strokeWidth = 3
    indice6:setFillColor( 0 )
    indice6:setStrokeColor( 0, 0, 0 )

    function indice6:touch( event )
        if event.phase == "ended" then
            jogada6(jogador)
            return true
        end
    end
    indice6:addEventListener( "touch",indice6)


    local indice7 = display.newRect( 80,380, 70, 70 )
    indice7.strokeWidth = 3
    indice7:setFillColor( 0 )
    indice7:setStrokeColor( 0, 0, 0 )

    function indice7:touch( event )
        if event.phase == "ended" then
            jogada7(jogador)
            return true
        end
    end

    indice7:addEventListener( "touch",indice7)

    local indice8 = display.newRect( 160,380, 70, 70 )
    indice8.strokeWidth = 3
    indice8:setFillColor( 0 )
    indice8:setStrokeColor( 0, 0, 0 )

    function indice8:touch( event )
        if event.phase == "ended" then
            jogada8(jogador)
            return true
        end
    end
    indice8:addEventListener( "touch",indice8)

    local indice9  = display.newRect( 240,380, 70, 70 )
    indice9.strokeWidth = 3
    indice9:setFillColor( 0)
    indice9:setStrokeColor( 0, 0, 0 )

    function indice9:touch( event )
        if event.phase == "ended" then
            jogada9(jogador)
            return true
        end
    end
    indice9:addEventListener( "touch",indice9)

end

inicioJogo()
