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
