nextflow.enable.dsl=2

process sayHello {
    input:
        val cheers
    output:
        stdout emit: verbiage
    script:
    """
    echo -n $cheers
    """
}

workflow {
    things = channel.of('Hello World!', 'Yo, dude!', 'Duck!')
    sayHello(things)
    sayHello.out.verbiage.view()
}
