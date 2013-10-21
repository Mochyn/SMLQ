signature STUDY_PROGRAMME =
sig
	type study_programme
	(* ects(sp) returns the number of ECTS it takes to
		graduate from sp *)
	val bswu: study_programme
	val kdd: study_programme
	val ects: study_programme -> int
	(* title(edu) returns the title of an education, in English *)
	val title: study_programme -> string
end

structure StudyProgramme :> STUDY_PROGRAMME = 
struct
	type study_programme = {
		title : string,
		ects : int
	}

	val bswu = {
		title = "Bachelor in Software Development",
		ects = 180
	}

	val kdd = {
		title = "MSc in Digital Design",
		ects = 180
	}

	fun ects (sp:study_programme) = (#ects sp)

	fun title (edu:study_programme) = (#title edu)
end

signature COURSE =
sig
	type study_programme = StudyProgramme.study_programme
	type course
	val all_courses	:	course list
	val name	:	course -> string
	val part_of	:	course -> study_programme
end

structure Course:> COURSE =
struct
	type study_programme = StudyProgramme.study_programme

	type course = {
		name	:	string,
		part_of	:	study_programme
	}

	val all_courses = [
		{ part_of = StudyProgramme.bswu, name = "Introduction to Programming"},
		{ part_of = StudyProgramme.kdd, name = "Introduction to Digital Design"}
	]

	fun name(c:course) = (#name c)

	fun part_of(c:course) = (#part_of c)
end;
