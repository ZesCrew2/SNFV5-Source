

function onCreatePost()
    if not middlescroll then --if middlescroll is disabled, swap the positions of the strums
        setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)

        setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)

        setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)

        setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 0)

        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 0)

        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 0)

        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 0)
    end
end
function onUpdatePost() --invert the icons and hp bar

    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *   getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)

    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)

    setProperty('iconP1.x',P1Mult - 104)

    setProperty('iconP1.origin.x',238)

    setProperty('iconP1.flipX',true)

    setProperty('iconP2.x',P2Mult + 100)

    setProperty('iconP2.origin.x',-85)

    setProperty('iconP2.flipX',true)

    setProperty('healthBar.flipX',true)

end