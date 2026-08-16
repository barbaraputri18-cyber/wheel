let padding = {top: 50, right: 100, bottom: 50, left: 100},
    w = 800 - padding.left - padding.right,
    h = 800 - padding.top - padding.bottom,
    r = Math.min(w, h) / 2,
    initialrotation = 0,
    rotation = 0,
    oldrotation = 0,
    picked = 100000,
    oldpick = [],
    color = d3.scale.category20();

// Loads the tick audio sound in to an audio object.
// let audio = new Audio('static/media/tick.mp3');
let audio = new Audio(music);

let svg = d3.select('#chart')
    .append("svg")
    .data([prizes])
    .attr("viewBox", "0 0 800 800")
    .attr("preserveAspectRatio", "xMidYMid meet")
    .attr("width", "100%")
    .attr("height", "auto")

let container = svg.append("g")
    .attr("class", "chartholder")
    .attr("transform", "translate(" + (w / 2 + padding.left) + "," + (h / 2 + padding.top) + ")");

let vis = container
    .append("g");


let myimage = vis.append('image')
    .attr('xlink:href', url_wheel)
    .attr('width', 800)
    .attr('height', 800)
    .attr('x', -400)
    .attr('y', -400);

let outwheel = svg.append('image')
    .attr('xlink:href', url_outwheel)
    .attr('width', 800)
    .attr('height', 800)
    // .on("click", spin) // For debug only
;


let pie = d3.layout.pie().value(function (d) {
    return 1;
});

// declare an arc generator function
let arc = d3.svg.arc().outerRadius(r);


let arcs = vis.selectAll("g.slice")
    .data(pie)
    .enter()
    .append("g")
    .append("text")
        .attr("x", -130)
        .attr("y", 5)
        .attr("class", "wheelText")
        .attr("text-anchor", "middle")
        .attr("text-rendering", "optimizeLegibility")
        .text(function (d, i) {
            return prizes[i].label;
        })

        .attr("transform", function (d) {
            d.innerRadius = 0;
            d.outerRadius = r;
            phi = 360 / d.data.total;
            return "rotate(" + ((d.data.sorter-1) * phi) + ")translate(" + (d.outerRadius - 10) + ")";
        });


arcs.append("path")
    .attr("fill-opacity","0.0")
    .attr("fill", function (d, i) {
        return color(i);
    })
    .attr("d", function (d) {
        return arc(d);
    });


function spinToResult(r) {
    initialrotation = r
    vis.transition()
        .duration(0)
        .ease( "linear" )
        .attrTween("transform", rotInitial)
}

function introRotation(r) {
    rotation = r
    vis.transition()
        .duration(5000)
        .ease(d3.easeCubicInOut)
        .attrTween("transform", rotIntro)
}

function intro(r) {
    initialrotation = r
    vis.transition()
        .duration(5000)
        .ease( "linear" )
        .attrTween("transform", rotInitial)
        .each("end", function () {
            d3.select(".slice:nth-child(" + (3 + 2) + ") path")
                .attr("fill-opacity","0.5")
                .attr("fill", "#e9e9e9");
        });
}

function spin(url, r) {
    container.on("click", null);

    //all slices have been seen, all done
    console.log("OldPick: " + oldpick.length, "Data length: " + prizes.length);

    if (oldpick.length === prizes.length) {
        console.log("done");
        container.on("click", null);
        return;
    }
    let result = r;
    console.log("result: " + result);

    picked = result;
    console.log("picked+1: " + (picked));

    if (oldpick.indexOf(picked) !== -1) {
        d3.select(this).call(spin);
        return;
    } else {
        oldpick.push(picked);
    }

    rotation = result;
    playSound();

    vis.transition()
        .duration(13000)
        .ease("cubic-in-out")
        .attrTween("transform", rotTween)
        .each("end", function () {
            var settleRotation = rotation + (rotation >= oldrotation ? 2 : -2);

            vis.transition()
                .duration(160)
                .ease("cubic-out")
                .attr("transform", "rotate(" + settleRotation + ")")
                .transition()
                .duration(320)
                .ease("cubic-in-out")
                .attr("transform", "rotate(" + rotation + ")")
                .each("end", function () {
                    d3.select(".slice:nth-child(" + (picked + 2) + ") path")
                        .attr("fill-opacity","0.5")
                        .attr("fill", "#e9e9e9");

                    oldrotation = rotation;
                    console.log('finished!', rotation);
                    if (typeof url === 'function') {
                        url();
                    } else {
                        window.location.href = url;
                    }
                });
        });
}

// This function is called when the sound is to be played.
function playSound() {
    // Stop and rewind the sound if it already happens to be playing.
    audio.pause();
    audio.currentTime = 0;

    // Play the sound.
    audio.play();
}

function rotTween(to) {
    let i = d3.interpolate(oldrotation, rotation);
    return function (t) {
        // playSound();
        return "rotate(" + i(t) + ")";
    };
}

function rotInitial(to) {
    let i = d3.interpolate(0, initialrotation);
    return function (t) {
        return "rotate(" + i(t) + ")";
    };
}

function rotIntro(to) {
    let i = d3.interpolate(rotation % 360, rotation);
    return function (t) {
        return "rotate(" + i(t) + ")";
    };
}
